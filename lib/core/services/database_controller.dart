import 'dart:developer';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/services/excel_services.dart';
import 'package:planning_system/core/services/parsers/examen_creneau_parser.dart';

class DatabaseController extends GetxController {
  final AppDb db = Get.find();
  final ExcelService excelService = Get.find();

  /// Reads an Excel file (picked via ExcelService), parses exams, inserts into
  /// CreneauTable (grouped), ExamenTable and then inserts Affectation rows.
  /// A créneau is defined by (dateExam, seance-from-heureDebut, session, semestre).
  /// nbSalle for each créneau is computed as the distinct count of code_salle.
  Future<void> importExamsAndAffectationsFromExcel() async {
    final parsed = await excelService.readExcelData<ParsedExamRow>(
      parser: const ExamenExcelParser(),
    );

    await parsed.fold(
      (failure) async {
        log('Import Excel (exams) failed: ${failure.msg}');
      },
      (rows) async {
        log(rows.toString());
        if (rows.isEmpty) return;

        // Note: No matiere resolution needed; each Excel row becomes one exam

        // 1) Group parsed rows into créneaux by (date, seance (from time), session, semestre)
        final groups = <String, List<ParsedExamRow>>{};
        for (final r in rows) {
          final seance = _seanceFromTime(r.heureDebut);
          final d = r.dateExam;
          final key =
              '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}'
              '-${seance.name}-${r.session.name}-${r.semestre.name}';
          groups.putIfAbsent(key, () => []).add(r);
        }

        // 2) For each group, create a creneau, then insert affectations and exams linked to it
        for (final entry in groups.entries) {
          final list = entry.value;
          final first = list.first;
          final seance = _seanceFromTime(first.heureDebut);
          final nbSalles = list.map((e) => e.codeSalle).toSet().length;

          // Insert creneau and retrieve generated code
          final codeCreneau = await db
              .into(db.creneauTable)
              .insert(
                CreneauTableCompanion.insert(
                  nbSalle: nbSalles,
                  seance: seance,
                  dateCreneau: DateTime(
                    first.dateExam.year,
                    first.dateExam.month,
                    first.dateExam.day,
                  ),
                ),
              );

          // Skipped affectation insert by request; only creneaux and exams are inserted

          // Build and insert exams linked to this creneau (one per Excel row)
          final examens = <ExamenTableCompanion>[];
          for (final r in list) {
            examens.add(
              ExamenTableCompanion.insert(
                codeCreneau: codeCreneau,
                codeSmartexEns: r.codeEnseignant,
                // If Excel has a class column, map it here. Using typeExamen as placeholder.
                classe: r.typeExamen,
              ),
            );
          }
          if (examens.isNotEmpty) {
            await db.batch((b) => b.insertAll(db.examenTable, examens));
          }
        }
      },
    );
  }

  // Heuristic mapping from HH:MM to SeanceEnum buckets
  SeanceEnum _seanceFromTime(String time) {
    final parts = time.split(':');
    final h = int.tryParse(parts[0]) ?? 0;
    final m = int.tryParse(parts[1]) ?? 0;
    final minutes = h * 60 + m;
    // Adjust thresholds to match your institute's schedule if needed
    if (minutes < 10 * 60) return SeanceEnum.s1; // before 10:00
    if (minutes < 12 * 60) return SeanceEnum.s2; // 10:00 - 11:59
    if (minutes < 15 * 60) return SeanceEnum.s3; // 12:00 - 14:59
    return SeanceEnum.s4; // 15:00+
  }
}

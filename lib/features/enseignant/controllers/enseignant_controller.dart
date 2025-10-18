import 'dart:developer';
import 'dart:async';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/services/excel_services.dart';
import 'package:planning_system/core/services/export/enseignant_exporter.dart';
import 'package:planning_system/core/services/parsers/enseignant_excel_parser.dart';
import 'package:planning_system/features/enseignant/models/grade_stat_model.dart';

class EnseignantController extends GetxController {
  // services
  final AppDb db = Get.find();
  final ExcelService excelService = Get.find();

  // Grades steam lena
  Stream<List<GradeStatModel>> get gradeStatsStream =>
      db.watchGradesStats().map(
        (rows) => rows
            .map(
              (row) => GradeStatModel(
                gradeEnum: GradeEnum.parseGrade(
                  row.data['codeGrade'] as String,
                ),
                total: row.data['totalEnseignants'] as int? ?? 0,
                participants: row.data['totalParticipants'] as int? ?? 0,
                nbOfSeance: row.data['nbOfSeance'] as int? ?? 0,
              ),
            )
            .toList(),
      );

  // Enseignants steam lena
  Stream<List<Map<String, dynamic>>> get enseignantsStream =>
      db.watchAllEnseignant().map(
        (rows) => rows
            .map(
              (row) => {
                '_id': row.codeSmartexEns,
                'Nom': row.nomEns,
                'Prénom': row.prenomEns,
                'Email': row.emailEns,
                'Grade': row.gradeCodeEns,
                'Participe': row.participeSurveillance,
                // TODO: fetch nb of hours from grade
                'Max surveillances': 8,
              },
            )
            .toList(),
      );

  // TODO: use it by algo
  Future<List<GradeStatModel>> readGradeStatsOnce() async {
    final stats = await db.getGradesStats();
    return stats
        .map(
          (row) => GradeStatModel(
            gradeEnum: GradeEnum.parseGrade(row.data['codeGrade'] as String),
            total: row.data['totalEnseignants'] as int? ?? 0,
            participants: row.data['totalParticipants'] as int? ?? 0,
            nbOfSeance: row.data['nbHeure'] as int? ?? 0,
          ),
        )
        .toList();
  }

  Future<void> updateGradeNbOfSeance({
    required int nb,
    required GradeEnum grade,
  }) async {
    await db.updateGradeNbOfSeance(nb: nb, grade: grade);
  }

  Future<void> insertEnseignant({required Enseignant model}) async {
    await db.insertEnseignant(model: model);
  }

  Future<void> exportEnseignantData() async {
    final data = await readAllEnseignant();
    final result = await excelService.exportExcelData(
      data: data,
      exporter: EnseignantExporter(),
    );
    await result.fold(
      (failure) async {
        log(failure.msg);
      },
      (filePath) async {
        log(filePath);
      },
    );
  }

  Future<void> insertAllEnseignant() async {
    final result = await excelService.readExcelData(
      parser: const EnseignantExcelParser(),
    );

    await result.fold(
      (failure) async {
        log(failure.msg);
      },
      (enseignantsList) async {
        await db.insertAllEnseignant(models: enseignantsList);
      },
    );
  }

  Future<void> deleteEnseignantByCode(String codeSmartexEns) async {
    await db.deleteEnseignant(codeSmartexEns: codeSmartexEns);
  }

  // TODO: use it by algo
  Future<List<Enseignant>> readAllEnseignant() async {
    return await db.readAllEnseignant();
  }
}

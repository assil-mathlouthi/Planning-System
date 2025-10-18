import 'dart:developer';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/services/excel_services.dart';
import 'package:planning_system/core/services/parsers/voeux_excel_parser.dart';
import 'package:planning_system/core/services/export/voeux_exporter.dart';

class VoeuxController extends GetxController {
  // services
  final AppDb db = Get.find();
  final ExcelService excelService = Get.find();

  String _normalizeKey(String nom, String prenom) {
    return '${nom.trim().toLowerCase()}|${prenom.trim().toLowerCase()}';
  }

   Future<void> deleteVoeuById(int id) async {
    await db.deleteVoeu(id: id);
  }

  // Reactive stream for Voeux joined with names
  Stream<List<Map<String, dynamic>>> get voeuxStream =>
      db.watchAllVoeuxWithTeacherNames().map(
        (rows) => rows
            .map(
              (row) => {
                '_id': row.read<int>('id'),
                'Nom': row.read<String>('nomEns'),
                'Prénom': row.read<String>('prenomEns'),
                'Session': SessionEnum.parseSession(
                  row.read<String>('session'),
                ),
                'Semestre': SemestreEnum.parseSemestre(
                  row.read<String>('semestre'),
                ),
                'jour': row.read<int>('jour'),
                'Séance': SeanceEnum.parseSeance(row.read<String>('seance')),
              },
            )
            .toList(),
      );

  // Reactive count of voeux
  Stream<int> get voeuxCountStream =>
      db.watchAllVoeuxWithTeacherNames().map((rows) => rows.length);

  Future<void> insertAllVoeux() async {
    final resolverMap = await _buildResolver();

    final result = await excelService.readExcelData(
      parser: VoeuxExcelParser(
        resolveCode: (n, p) => resolverMap[_normalizeKey(n, p)],
      ),
    );

    await result.fold((failure) async => log(failure.msg), (
      voeuxCompanions,
    ) async {
      await db.insertAllVouex(models: voeuxCompanions);
    });
  }

  Future<Map<String, String>> _buildResolver() async {
    final enseignants = await db.readAllEnseignant();
    final map = <String, String>{};
    for (final e in enseignants) {
      map[_normalizeKey(e.nomEns, e.prenomEns)] = e.codeSmartexEns;
    }
    return map;
  }

  Future<void> exportVoeux() async {
    final dataRows = await db.readAllVoeuxWithTeacherNames();
    final exporter = VoeuxExporter();
    final result = await excelService.exportExcelData(
      data: dataRows,
      exporter: exporter,
      fileName: 'voeux_export',
    );
    result.fold((l) => log(l.msg), (r) => log(r));
  }
}

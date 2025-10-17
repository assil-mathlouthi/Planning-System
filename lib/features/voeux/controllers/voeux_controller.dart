import 'dart:developer';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/services/excel_services.dart';
import 'package:planning_system/core/services/parsers/voeux_excel_parser.dart';

class VoeuxController extends GetxController {
  // services
  final AppDb db = Get.find();
  final ExcelService excelService = Get.find();
  List<Map<String, dynamic>> voeux = [];

  Future<void> insertAllVoeux() async {
    final result = await excelService.readExcelData(
      parser: const VoeuxExcelParser(),
    );

    await result.fold((failure) async => log(failure.msg), (
      voeuxCompanions,
    ) async {
      await db.insertAllVouex(models: voeuxCompanions);
      await readAllVoeuxWithNames();
    });
  }

  /// This method will be used by the algorithme not 100% but I think so
  Future<List<Voeux>> readAllVoeux() async {
    final voeuxRows = await db.readAllVoeux();
    return voeuxRows;
  }

  Future<void> readAllVoeuxWithNames() async {
    final joinedRows = await db.readAllVoeuxWithTeacherNames();
    voeux = joinedRows.map((row) {
      return {
        'Nom': row.read<String>('nomEns'),
        'Prénom': row.read<String>('prenomEns'),
        'Session': row.read<String>('session'),
        'Semestre': row.read<String>('semestre'),
        'jour': row.read<int>('jour'),
        'Séance': row.read<String>('seance'),
        'CodeSmartex': row.read<String>('codeSmartexEns'),
      };
    }).toList();
  }
}

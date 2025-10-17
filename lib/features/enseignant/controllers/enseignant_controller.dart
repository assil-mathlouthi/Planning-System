import 'dart:developer';
import 'dart:async';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/services/excel_services.dart';
import 'package:planning_system/core/services/parsers/enseignant_excel_parser.dart';
import 'package:planning_system/features/enseignant/models/grade_stat_model.dart';

class EnseignantController extends GetxController {
  // services
  final AppDb db = Get.find();
  final ExcelService excelService = Get.find();
  // attributes
  List<GradeStatModel> grades = [];

  // init data
  @override
  void onInit() async {
    super.onInit();
    // UI will listen to enseignantsStream directly
    await getGradeStats();
  }

  // Expose a reactive stream for the UI to listen to directly
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

  Future<void> getGradeStats() async {
    final stats = await db.getGradesStats();
    grades = stats.map((row) {
      return GradeStatModel(
        gradeEnum: GradeEnum.parseGrade(row.data['codeGrade'] as String),
        total: row.data['totalEnseignants'] as int? ?? 0,
        participants: row.data['totalParticipants'] as int? ?? 0,
        nbOfSeance: row.data['nbOfSeance'] as int? ?? 0,
      );
    }).toList();
  }

  Future<void> insertEnseignant({required Enseignant model}) async {
    await db.insertEnseignant(model: model);
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

  // No subscription held; UI should listen to enseignantsStream directly.

  // this method will be used by the algorithme
  Future<List<Enseignant>> readAllEnseignant() async {
    return await db.readAllEnseignant();
  }
}

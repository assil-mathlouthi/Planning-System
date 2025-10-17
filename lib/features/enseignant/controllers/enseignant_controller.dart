import 'dart:developer';

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
  List<Map<String, dynamic>> enseignants = [];
  List<GradeStatModel> grades = [];

  // init data
  @override
  void onInit() async {
    super.onInit();
    await readAllEnseignant();
    await getGradeStats();
    
  }

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
        await readAllEnseignant();
      },
    );
  }

  Future<void> readAllEnseignant() async {
    final enseignantRows = await db.readAllEnseignant();

    enseignants = enseignantRows.map((row) {
      return {
        'Nom': row.nomEns,
        'Prénom': row.prenomEns,
        'Email': row.emailEns,
        'Grade': row.gradeCodeEns,
        'Participe': row.participeSurveillance,
        //TODO: fetch nb of hours from grade
        'Max surveillances': 8,
      };
    }).toList();
  }
}

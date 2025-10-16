import 'dart:developer';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/services/excel_services.dart';
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
        nbHours: row.data['nbHeure'] as double? ?? 0,
      );
    }).toList();
  }

  Future<void> insertEnseignant({required Enseignant model}) async {
    await db.insertEnseignant(model: model);
  }

  Future<void> insertAllEnseignant() async {
    // get the data from the excel
    final data = await excelService.readExcelData();
    data.fold(
      (l) {
        log(l.toString());
      },
      (r) {
        // then pass it to the db
        db.insertAllEnseignant(models: r);
      },
    );
  }

  Future<void> readAllEnseignant() async {
    final data = await db.readAllEnseignant();
    final convertedData = data.map((e) => e.toJson()).toList();
    enseignants = convertedData;
  }
}

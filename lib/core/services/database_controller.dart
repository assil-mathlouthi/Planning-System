import 'dart:developer';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/services/excel_services.dart';

class DatabaseController extends GetxController {
  final AppDb db;
  final ExcelService excelService = Get.find();

  DatabaseController({required this.db});

  Future<void> insertGrades({required List<Grade> models}) async {
    await db.insertGrades(models: models);
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

  Future<List<Enseignant>> readAllEnseignant() async {
    final data = await db.readAllEnseignant();
    log(data.toString());
    return data;
  }
}

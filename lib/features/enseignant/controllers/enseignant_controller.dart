import 'dart:developer';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/services/excel_services.dart';

class EnseignantController extends GetxController {
  // services
  final AppDb db = Get.find();
  final ExcelService excelService = Get.find();
  // attributes
  List<Map<String, dynamic>> enseignants = [];

  // init data
  @override
  void onInit() async {
    super.onInit();
    await readAllEnseignant();
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
    log(convertedData.toString());
    enseignants = convertedData;
  }
}

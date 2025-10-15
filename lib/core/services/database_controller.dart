
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
}

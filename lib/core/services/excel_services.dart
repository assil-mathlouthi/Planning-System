import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:excel/excel.dart';
import 'package:planning_system/core/errors/failure.dart';
import 'package:planning_system/core/interface/excel_interface.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';
import 'package:planning_system/core/models/enseignant_model.dart';

class ExcelService implements ExcelInterface<EnseignantModel> {
  final FilePickerInterface picker;
  ExcelService({required this.picker});

  @override
  Future<Either<Failure, List<EnseignantModel>>> readExcelData() async {
    final file = await picker.pickFilePath(
      allowedExtensions: const ['xlsx', 'xls'],
    );
    if (file.isEmpty) {
      return left(Failure(msg: 'Excel picking canceled'));
    }
    try {
      final bytes = File(file).readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);
      final table = excel.tables.keys.first;
      final sheet = excel.tables[table];
      if (sheet == null) return left(Failure(msg: 'Empty Excel sheet'));
      final List<EnseignantModel> enseignants = [];

      // skip header row
      for (var i = 1; i < sheet.rows.length; i++) {
        final row = sheet.rows[i];
        try {
          final model = EnseignantModel.fromExcel(row);
          enseignants.add(model);
        } catch (e) {
          return left(Failure(msg: e.toString()));
        }
      }
      return right(enseignants);
    } catch (e) {
      return left(Failure(msg: 'Failed to read Excel: $e'));
    }
  }
}

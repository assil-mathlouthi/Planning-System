import 'dart:developer';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';
import 'package:planning_system/core/models/enseignant_model.dart';

class ExcelService {
  final FilePickerInterface picker;
  ExcelService({required this.picker});

  Future<void> readExceldata() async {
    final file = await picker.pickFilePath(
      allowedExtensions: const ['xlsx', 'xls'],
    );
    if (file.isEmpty) {
      // TODO: lena wali dhaherla error
      log('Excel picking canceled');
      return;
    }
    try {
      final bytes = File(file).readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);
      final table = excel.tables.keys.first;
      final sheet = excel.tables[table];
      if (sheet == null) return;

      final List<EnseignantModel> enseignants = [];
      // Optionally skip header row if present
      for (var i = 1; i < sheet.rows.length; i++) {
        final row = sheet.rows[i];
        try {
          final model = EnseignantModel.fromExcel(row);
          enseignants.add(model);
        } catch (e) {
          log('Failed to parse row $i: $e');
        }
      }
      log('Imported ${enseignants.length} enseignants');
      // TODO: Save enseignants to DB or use as needed
    } catch (e, st) {
      log('Failed to read Excel: $e', stackTrace: st);
    }
  }
}

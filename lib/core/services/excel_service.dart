import 'dart:developer';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';

class ExcelService {
  final FilePickerInterface picker;
  ExcelService({required this.picker});

  Future<void> readExceldata() async {
    final file = await picker.pickFilePath(
      allowedExtensions: const ['xlsx', 'xls'],
    );
    if (file.isEmpty) {
      log('Excel picking canceled');
      return;
    }

    try {
      final bytes = File(file).readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);
      for (final table in excel.tables.keys) {
        log('Sheet: $table');
        final sheet = excel.tables[table];
        if (sheet == null) {
          log('Warning: sheet "$table" is null, skipping');
          continue;
        }
        log('Columns: ${sheet.maxColumns}, Rows: ${sheet.maxRows}');

        for (final row in sheet.rows) {
          for (final cell in row) {
            if (cell == null) {
              log('  null cell');
              continue;
            }
            log('cell ${cell.rowIndex}/${cell.columnIndex}');
            final value = cell.value;
            final numFormat =
                cell.cellStyle?.numberFormat ?? NumFormat.standard_0;
            switch (value) {
              case null:
                log('  empty cell');
                log('  format: $numFormat');
              case TextCellValue():
                log('  text: ${value.value}');
              case FormulaCellValue():
                log('  formula: ${value.formula}');
                log('  format: $numFormat');
              case IntCellValue():
                log('  int: ${value.value}');
                log('  format: $numFormat');
              case BoolCellValue():
                log('  bool: ${value.value ? 'YES!!' : 'NO..'}');
                log('  format: $numFormat');
              case DoubleCellValue():
                log('  double: ${value.value}');
                log('  format: $numFormat');
              case DateCellValue():
                log(
                  '  date: ${value.year} ${value.month} ${value.day} (${value.asDateTimeLocal()})',
                );
              case TimeCellValue():
                log(
                  '  time: ${value.hour} ${value.minute} ... (${value.asDuration()})',
                );
              case DateTimeCellValue():
                log(
                  '  date with time: ${value.year} ${value.month} ${value.day} ${value.hour} ... (${value.asDateTimeLocal()})',
                );
            }
          }
          log('$row');
        }
      }
    } catch (e, st) {
      log('Failed to read Excel: $e', stackTrace: st);
    }
  }
}

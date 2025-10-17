import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:excel/excel.dart';
import 'package:planning_system/core/errors/failure.dart';
import 'package:planning_system/core/interface/excel_interface.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';

class ExcelService implements ExcelInterface {
  final FilePickerInterface picker;
  ExcelService({required this.picker});

  @override
  Future<Either<Failure, List<T>>> readExcelData<T>({
    required ExcelParser<T> parser,
  }) async {
    final file = await picker.pickFilePath(
      allowedExtensions: const ['xlsx', 'xls'],
    );

    if (file.isEmpty) {
      return left(Failure(msg: 'Excel picking canceled'));
    }

    try {
      final bytes = File(file).readAsBytesSync();
      final excel = Excel.decodeBytes(bytes);

      if (excel.tables.isEmpty) {
        return left(Failure(msg: 'No worksheets found in the Excel file.'));
      }

      final sheet = excel.tables.values.first;
      if (sheet.rows.isEmpty) {
        return left(Failure(msg: 'Empty Excel sheet.'));
      }

      final rows = sheet.rows;

      final startIndex = parser.startRowIndex;
      if (startIndex >= rows.length) {
        return right(<T>[]);
      }
      final List<T> results = [];

      for (var rowIndex = startIndex; rowIndex < rows.length; rowIndex++) {
        final row = rows[rowIndex];

        if (_isRowEmpty(row)) {
          continue;
        }

        try {
          results.add(parser.parseRow(row));
        } catch (e) {
          return left(
            Failure(msg: 'Failed to parse Excel row ${rowIndex + 1}: $e'),
          );
        }
      }

      return right(results);
    } catch (e) {
      return left(Failure(msg: 'Failed to read Excel: $e'));
    }
  }

  bool _isRowEmpty(List<Data?> row) {
    return row.every((cell) {
      final value = cell?.value;
      if (value == null) return true;
      final stringValue = value.toString().trim();
      return stringValue.isEmpty || stringValue.toLowerCase() == 'null';
    });
  }
}

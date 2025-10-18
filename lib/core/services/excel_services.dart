import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:excel/excel.dart';
import 'package:planning_system/core/errors/failure.dart';
import 'package:planning_system/core/interface/excel_interface.dart';
import 'package:planning_system/core/interface/exporter_interface.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';
import 'package:planning_system/core/interface/parser_interface.dart';

class ExcelService implements ExcelInterface {
  final FilePickerInterface picker;
  ExcelService({required this.picker});

  @override
  Future<Either<Failure, String>> exportExcelData<T>({
    required Iterable<T> data,
    required ExcelExporter<T> exporter,
    String? fileName,
  }) async {
    try {
      final excel = Excel.createExcel();
      final sheetName = exporter.sheetName;
      final sheet = excel[sheetName];

      // Write headers (as TextCellValue)
      final headers = exporter.headers
          .map<CellValue?>((h) => TextCellValue(h))
          .toList();
      sheet.appendRow(headers);

      // Write data rows
      for (final item in data) {
        final rowCells = exporter
            .mapRow(item)
            .map<CellValue?>(_toCellValue)
            .toList();
        sheet.appendRow(rowCells);
      }

      // Autosize columns (best-effort; excel package has limited support)
      // No direct autosize API; leave as-is or compute widths manually if needed.

      // Build filename
      final now = DateTime.now();
      final safeName = (fileName?.trim().isNotEmpty == true)
          ? fileName!.trim()
          : 'export_${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';
      final bytes = excel.encode();
      if (bytes == null) {
        return left(Failure(msg: 'Failed to encode Excel file.'));
      }

      // Save in user Documents by default
      final directory = Directory.systemTemp; // fallback
      // For cross-platform, you may inject a saver service; for now, use working dir
      final path = '${directory.path}${Platform.pathSeparator}$safeName.xlsx';
      final outFile = File(path);
      await outFile.writeAsBytes(bytes, flush: true);

      return right(outFile.path);
    } catch (e) {
      return left(Failure(msg: 'Failed to export Excel: $e'));
    }
  }

  CellValue _toCellValue(dynamic v) {
    if (v == null) return TextCellValue('');
    if (v is bool) return BoolCellValue(v);
    if (v is int) return IntCellValue(v);
    if (v is double) return DoubleCellValue(v);
    if (v is num) return DoubleCellValue(v.toDouble());
    if (v is DateTime) return TextCellValue(v.toIso8601String());
    return TextCellValue(v.toString());
  }

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

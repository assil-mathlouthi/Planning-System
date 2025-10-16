import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:excel/excel.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/errors/failure.dart';
import 'package:planning_system/core/interface/excel_interface.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';

class ExcelService implements ExcelInterface<Enseignant> {
  final FilePickerInterface picker;
  ExcelService({required this.picker});

  Enseignant readfromExcel(List<Data?> row) {
    String getCellValue(int index) {
      final cell = row[index]?.value;
      if (cell == null) throw Exception('Cell at index $index is empty');
      return cell.toString().trim();
    }

    try {
      return Enseignant(
        codeSmartexEns: getCellValue(4),
        nomEns: getCellValue(0),
        prenomEns: getCellValue(1),
        emailEns: getCellValue(2),
        gradeCodeEns: GradeEnum.parseGrade(getCellValue(3)),
        participeSurveillance: getCellValue(5).toLowerCase() == 'true',
      );
    } catch (e) {
      throw Exception(
        'Failed to parse Excel row: $e\nRow data: ${row.map((cell) => cell?.value).toList()}',
      );
    }
  }

  @override
  Future<Either<Failure, List<Enseignant>>> readExcelData() async {
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
      final List<Enseignant> enseignants = [];

      // skip header row
      for (var i = 1; i < sheet.rows.length; i++) {
        final row = sheet.rows[i];
        try {
          final model = readfromExcel(row);
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

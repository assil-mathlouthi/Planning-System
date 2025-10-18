import 'package:excel/excel.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/helper/excel_mappers.dart';
import 'package:planning_system/core/interface/parser_interface.dart';

class VoeuxExcelParser extends ExcelParser<VoeuxTableCompanion> {
  const VoeuxExcelParser();

  @override
  VoeuxTableCompanion parseRow(List<Data?> row) {
    String readCell(int index) {
      if (index >= row.length) {
        throw Exception('Missing column at index $index');
      }
      final cell = row[index];
      final value = cell?.value;
      if (value == null) {
        throw Exception('Cell at index $index is empty');
      }
      final stringValue = value.toString().trim();
      if (stringValue.isEmpty) {
        throw Exception('Cell at index $index is empty');
      }
      return stringValue;
    }

    final semestre = ExcelMappers.parseSemestre(readCell(0));
    final session = ExcelMappers.parseSession(readCell(1));
    // TODO: here add logic to search for enseignant code with his full name
    final code = readCell(0);
    final jour = ExcelMappers.parseJour(readCell(4));
    final seance = ExcelMappers.parseSeance(readCell(5));

    return VoeuxTableCompanion.insert(
      codeSmartexEns: code,
      session: session,
      semestre: semestre,
      jour: jour,
      seance: seance,
    );
  }
}

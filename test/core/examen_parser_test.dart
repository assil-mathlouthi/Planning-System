import 'package:flutter_test/flutter_test.dart';
import 'package:planning_system/core/services/parsers/examen_creneau_parser.dart';
import 'package:excel/excel.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';

void main() {
  group('ExamenExcelParser', () {
    final parser = ExamenExcelParser();

    List<Data?> _buildRow(List<String> values) {
      final excel = Excel.createExcel();
      final sheet = excel['Sheet1'];
      final rowIndex = 0;
      final cells = <Data?>[];
      for (var i = 0; i < values.length; i++) {
        final cell = sheet.cell(
          CellIndex.indexByColumnRow(columnIndex: i, rowIndex: rowIndex),
        );
        cell.value = TextCellValue(values[i]);
        cells.add(cell);
      }
      return cells;
    }

    test('parses a valid row', () {
      final row = _buildRow([
        '31/12/2024', // date
        '08:30', // heure debut
        '10:30', // heure fin
        'Principale', // session
        'Examen final', // type
        'Semestre 2', // semestre
        'ENS001', // enseignant
        'SALLE-A', // salle
      ]);

      final res = parser.parseRow(row);
      expect(res.dateExam.year, 2024);
      expect(res.heureDebut, '08:30');
      expect(res.heureFin, '10:30');
      expect(res.session, SessionEnum.principale);
      expect(res.semestre, SemestreEnum.sem2);
      expect(res.codeEnseignant, 'ENS001');
      expect(res.codeSalle, 'SALLE-A');
    });

    test('throws on missing cells', () {
      final row = _buildRow(['31/12/2024']); // only one cell, others missing
      expect(() => parser.parseRow(row), throwsA(isA<Exception>()));
    });
  });
}

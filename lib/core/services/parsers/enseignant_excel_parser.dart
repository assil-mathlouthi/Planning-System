import 'package:excel/excel.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/interface/excel_interface.dart';

class EnseignantExcelParser extends ExcelParser<Enseignant> {
  const EnseignantExcelParser();

  static const _expectedHeaders = <String>[
    'nom',
    'prénom',
    'email',
    'grade',
    'code smartex',
    'participe',
  ];

  @override
  List<String> get expectedHeaders => _expectedHeaders;

  @override
  Enseignant parseRow(List<Data?> row) {
    String readCell(int index, {bool required = true}) {
      if (index >= row.length) {
        if (required) {
          throw Exception('Missing column at index $index');
        }
        return '';
      }
      final cell = row[index];
      final value = cell?.value;
      if (value == null) {
        if (required) {
          throw Exception('Cell at index $index is empty');
        }
        return '';
      }
      final stringValue = value.toString().trim();
      if (stringValue.isEmpty) {
        if (required) {
          throw Exception('Cell at index $index is empty');
        }
        return '';
      }
      return stringValue;
    }

    bool parseBool(String input) {
      final normalized = input.toLowerCase();
      return normalized == 'true' ||
          normalized == 'oui' ||
          normalized == 'yes' ||
          normalized == '1';
    }

    try {
      final code = readCell(4);
      final nom = readCell(0);
      final prenom = readCell(1);
      final email = readCell(2);
      final grade = GradeEnum.parseGrade(readCell(3));
      final participe = parseBool(readCell(5, required: false));

      return Enseignant(
        codeSmartexEns: code,
        nomEns: nom,
        prenomEns: prenom,
        emailEns: email,
        gradeCodeEns: grade,
        participeSurveillance: participe,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'dart:developer';

import 'package:excel/excel.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/helper/excel_mappers.dart';
import 'package:planning_system/core/interface/parser_interface.dart';

/// Lightweight DTO representing a parsed exam row from Excel
class ParsedExamRow {
  final DateTime dateExam;
  final String heureDebut;
  final String heureFin;
  final SessionEnum session;
  final String typeExamen;
  final SemestreEnum semestre;
  final String codeEnseignant;
  final String codeSalle;

  const ParsedExamRow({
    required this.dateExam,
    required this.heureDebut,
    required this.heureFin,
    required this.session,
    required this.typeExamen,
    required this.semestre,
    required this.codeEnseignant,
    required this.codeSalle,
  });
  @override
  String toString() {
    return 'ParsedExamRow('
        'dateExam: ${dateExam.toIso8601String()}, '
        'heureDebut: $heureDebut, '
        'heureFin: $heureFin, '
        'session: ${session.name}, '
        'typeExamen: $typeExamen, '
        'semestre: ${semestre.name}, '
        'codeEnseignant: $codeEnseignant, '
        'codeSalle: $codeSalle'
        ')';
  }
}

class ExamenExcelParser extends ExcelParser<ParsedExamRow> {
  const ExamenExcelParser();

  @override
  ParsedExamRow parseRow(List<Data?> row) {
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

    try {
      final dateExam = ExcelMappers.parseDate(readCell(0));
      final heureDebut = ExcelMappers.parseTime(readCell(1));
      final heureFin = ExcelMappers.parseTime(readCell(2));
      final session = ExcelMappers.parseSession(readCell(3));
      final typeExamen = readCell(4);
      final semestre = ExcelMappers.parseSemestre(readCell(5));
      final codeEnseignant = readCell(6);
      final codeSalle = readCell(7);

      final res = ParsedExamRow(
        dateExam: dateExam,
        heureDebut: heureDebut,
        heureFin: heureFin,
        session: session,
        typeExamen: typeExamen,
        semestre: semestre,
        codeEnseignant: codeEnseignant,
        codeSalle: codeSalle,
      );
      log(res.toString());
      return res;
    } catch (e) {
      throw Exception('Error parsing exam row: $e');
    }
  }
}

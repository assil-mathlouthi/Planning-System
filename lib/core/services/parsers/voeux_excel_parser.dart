import 'package:excel/excel.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/helper/excel_mappers.dart';
import 'package:planning_system/core/interface/parser_interface.dart';

class VoeuxExcelParser extends ExcelParser<VoeuxTableCompanion> {
  final String? Function(String fullName) resolveCode;

  const VoeuxExcelParser({required this.resolveCode});

  @override
  int get startRowIndex => 1;

  @override
  VoeuxTableCompanion parseRow(List<Data?> row) {
    // Not used - we use parseRowWithMultipleSeances instead
    throw UnsupportedError('Use parseRowWithMultipleSeances');
  }

  List<VoeuxTableCompanion> parseRowWithMultipleSeances(List<Data?> row) {
    String readCell(int index) {
      if (index >= row.length) {
        throw Exception('Missing column at index $index');
      }
      final value = row[index]?.value?.toString().trim() ?? '';
      if (value.isEmpty) throw Exception('Empty cell at index $index');
      return value;
    }

    // Fixed column order: Enseignant, Semestre, Session, Jour, Séances
    final enseignant = readCell(0);
    final semestre = ExcelMappers.parseSemestre(readCell(1));
    final session = ExcelMappers.parseSession(readCell(2));
    final jour = _parseJourToNumber(readCell(3));
    final seancesString = readCell(4);

    final code = resolveCode(enseignant);
    // If teacher code cannot be resolved, skip this row by returning no records
    if (code == null || code.trim().isEmpty) {
      return <VoeuxTableCompanion>[];
    }

    // Split seances and create multiple records
    final seances = seancesString
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty);

    return seances
        .map(
          (seance) => VoeuxTableCompanion.insert(
            codeSmartexEns: code,
            session: session,
            semestre: semestre,
            jour: jour, // Now using number instead of string
            seance: ExcelMappers.parseSeance(seance),
          ),
        )
        .toList();
  }

  int _parseJourToNumber(String jour) {
    switch (jour.toLowerCase()) {
      case 'lundi':
        return 1;
      case 'mardi':
        return 2;
      case 'mercredi':
        return 3;
      case 'jeudi':
        return 4;
      case 'vendredi':
        return 5;
      case 'samedi':
        return 6;
      case 'dimanche':
        return 7;
      default:
        throw Exception('Jour invalide: $jour');
    }
  }
}

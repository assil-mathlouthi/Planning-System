import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';

class ExcelMappers {
  static SemestreEnum parseSemestre(String input) {
    final normalized = input.toLowerCase();
    if (normalized.contains('1') ||
        normalized == 's1' ||
        normalized.contains('semestre 1')) {
      return SemestreEnum.sem1;
    }
    if (normalized.contains('2') ||
        normalized == 's2' ||
        normalized.contains('semestre 2')) {
      return SemestreEnum.sem2;
    }
    throw Exception('Invalid semestre value: $input');
  }

  static SessionEnum parseSession(String input) {
    final normalized = input.toLowerCase();
    if (normalized.contains('principale') || normalized == 'p') {
      return SessionEnum.principale;
    }
    if (normalized.contains('partiel') || normalized == 'c') {
      return SessionEnum.partiel;
    }
    throw Exception('Invalid session value: $input');
  }

  static SeanceEnum parseSeance(String input) {
    final normalized = input.toLowerCase();
    for (final seance in SeanceEnum.values) {
      if (seance.name == normalized) {
        return seance;
      }
    }
    if (normalized.contains('1')) return SeanceEnum.s1;
    if (normalized.contains('2')) return SeanceEnum.s2;
    if (normalized.contains('3')) return SeanceEnum.s3;
    if (normalized.contains('4')) return SeanceEnum.s4;
    throw Exception('Invalid seance value: $input');
  }

  static int parseJour(String input) {
    final parsed = int.tryParse(input);
    if (parsed == null) {
      throw Exception('Invalid jour value: $input');
    }
    return parsed;
  }
}

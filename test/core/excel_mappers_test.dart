import 'package:flutter_test/flutter_test.dart';
import 'package:planning_system/core/helper/excel_mappers.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/enums/seance.dart' as core_seance;

void main() {
  group('ExcelMappers.parseDate', () {
    test('parses DD/MM/YYYY', () {
      final d = ExcelMappers.parseDate('31/12/2024');
      expect(d.year, 2024);
      expect(d.month, 12);
      expect(d.day, 31);
    });

    test('throws on invalid format', () {
      expect(
        () => ExcelMappers.parseDate('2024-12-31'),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('ExcelMappers.parseTime', () {
    test('parses HH:MM', () {
      expect(ExcelMappers.parseTime('08:30'), '08:30');
    });

    test('parses HH:MM:SS', () {
      expect(ExcelMappers.parseTime('08:30:59'), '08:30');
    });

    test('extracts time from date+time', () {
      expect(ExcelMappers.parseTime('31/12/2024 08:45:00'), '08:45');
    });
  });

  group('ExcelMappers.parseSemestre', () {
    test('maps to sem1', () {
      expect(ExcelMappers.parseSemestre('S1'), SemestreEnum.sem1);
      expect(ExcelMappers.parseSemestre('Semestre 1'), SemestreEnum.sem1);
      expect(ExcelMappers.parseSemestre('1'), SemestreEnum.sem1);
    });

    test('maps to sem2', () {
      expect(ExcelMappers.parseSemestre('S2'), SemestreEnum.sem2);
      expect(ExcelMappers.parseSemestre('Semestre 2'), SemestreEnum.sem2);
      expect(ExcelMappers.parseSemestre('2'), SemestreEnum.sem2);
    });
  });

  group('ExcelMappers.parseSession', () {
    test('maps to principale', () {
      expect(ExcelMappers.parseSession('Principale'), SessionEnum.principale);
      expect(ExcelMappers.parseSession('P'), SessionEnum.principale);
    });
    test('maps to partiel', () {
      expect(ExcelMappers.parseSession('Partiel'), SessionEnum.partiel);
      expect(ExcelMappers.parseSession('C'), SessionEnum.partiel);
    });
  });

  group('ExcelMappers.parseSeance', () {
    test('maps known names', () {
      expect(ExcelMappers.parseSeance('s1'), core_seance.SeanceEnum.s1);
      expect(ExcelMappers.parseSeance('s2'), core_seance.SeanceEnum.s2);
      expect(ExcelMappers.parseSeance('s3'), core_seance.SeanceEnum.s3);
      expect(ExcelMappers.parseSeance('s4'), core_seance.SeanceEnum.s4);
    });

    test('maps numbers', () {
      expect(ExcelMappers.parseSeance('1'), core_seance.SeanceEnum.s1);
      expect(ExcelMappers.parseSeance('2'), core_seance.SeanceEnum.s2);
      expect(ExcelMappers.parseSeance('3'), core_seance.SeanceEnum.s3);
      expect(ExcelMappers.parseSeance('4'), core_seance.SeanceEnum.s4);
    });
  });
}

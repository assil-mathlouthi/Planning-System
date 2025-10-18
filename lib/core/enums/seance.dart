import 'package:flutter/services.dart';
import 'package:planning_system/core/utils/contants.dart';

enum SeanceEnum {
  s1,
  s2,
  s3,
  s4;

  static SeanceEnum parseSeance(String input) {
    final normalized = input.trim().toLowerCase();
    if (normalized.contains('s1') || normalized == 's 1') {
      return SeanceEnum.s1;
    }
    if (normalized.contains('s2') || normalized == 's 2') {
      return SeanceEnum.s2;
    }
    if (normalized.contains('s3') || normalized == 's 3') {
      return SeanceEnum.s3;
    }
    if (normalized.contains('s4') || normalized == 's 4') {
      return SeanceEnum.s4;
    }
    return SeanceEnum.s4;
  }

  ColorPair get colors =>
      (dark: const Color(0xFF193CB8), light: const Color(0xFFDBEAFE));
}

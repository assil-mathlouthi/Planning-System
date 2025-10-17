import 'package:flutter/services.dart';
import 'package:planning_system/core/utils/contants.dart';

enum SeanceEnum {
  s1,
  s2,
  s3,
  s4;

  ColorPair get colors =>
      (dark: const Color(0xFF193CB8), light: const Color(0xFFDBEAFE));
}

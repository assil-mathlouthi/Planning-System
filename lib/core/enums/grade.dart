import 'package:flutter/widgets.dart';
import 'package:planning_system/core/utils/contants.dart';

enum GradeEnum {
  pr,
  ma,
  v,
  ptc,
  ac,
  as,
  ex,
  pes,
  mc;

  static GradeEnum parseGrade(String gradeStr) {
    final normalized = gradeStr.toLowerCase();
    return GradeEnum.values.firstWhere(
      (g) => g.toString().split('.').last.toLowerCase() == normalized,
      orElse: () => throw Exception('Invalid grade: $gradeStr'),
    );
  }

  ColorPair get colors {
    switch (this) {
      case GradeEnum.pr:
        return (
          dark: const Color(0xFF193CB8),
          light: const Color(0xFFDBEAFE),
        ); // Blue
      case GradeEnum.ma:
        return (
          dark: const Color(0xFF6E11B0),
          light: const Color(0xFFF3E8FF),
        ); // Green
      case GradeEnum.v:
        return (
          dark: const Color(0xFF016630),
          light: const Color(0xFFDCFCE7),
        ); // Purple
      case GradeEnum.ptc:
        return (
          dark: const Color(0xFF005F78),
          light: const Color(0xFFCEFAFE),
        ); // Orange
      case GradeEnum.ac:
        return (
          dark: const Color(0xFF372AAC),
          light: const Color(0xFFE0E7FF),
        ); // Red
      case GradeEnum.as:
        return (
          dark: const Color(0xFF005F5A),
          light: const Color(0xFFCBFBF1),
        ); // Indigo
      case GradeEnum.ex:
        return (
          dark: const Color(0xFF973C00),
          light: const Color(0xFFFEF3C6),
        ); // Grey
      case GradeEnum.pes:
        return (
          dark: const Color(0xFFA3004C),
          light: const Color(0xFFFCE7F3),
        ); // Amber/Yellow
      case GradeEnum.mc:
        return (
          dark: const Color(0xFF006045),
          light: const Color(0xFFD0FAE5),
        ); // Brown
    }
  }
}

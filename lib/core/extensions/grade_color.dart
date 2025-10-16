import 'package:flutter/material.dart';
import 'package:planning_system/core/enums/grade.dart';


typedef ColorPair = ({Color dark, Color light});

extension GradeColorExtension on GradeEnum {
  ColorPair get colors {
    switch (this) {
      case GradeEnum.pr:
        return (
          dark: const Color(0xFF0D47A1),
          light: const Color(0xFFBBDEFB),
        ); // Blue
      case GradeEnum.ma:
        return (
          dark: const Color(0xFF1B5E20),
          light: const Color(0xFFC8E6C9),
        ); // Green
      case GradeEnum.v:
        return (
          dark: const Color(0xFF4A148C),
          light: const Color(0xFFE1BEE7),
        ); // Purple
      case GradeEnum.ptc:
        return (
          dark: const Color(0xFFE65100),
          light: const Color(0xFFFFE0B2),
        ); // Orange
      case GradeEnum.va:
        return (
          dark: const Color(0xFF004D40),
          light: const Color(0xFFB2DFDB),
        ); // Teal
      case GradeEnum.ac:
        return (
          dark: const Color(0xFFB71C1C),
          light: const Color(0xFFFFCDD2),
        ); // Red
      case GradeEnum.as:
        return (
          dark: const Color(0xFF1A237E),
          light: const Color(0xFFC5CAE9),
        ); // Indigo
      case GradeEnum.ex:
        return (
          dark: const Color(0xFF212121),
          light: const Color(0xFFE0E0E0),
        ); // Grey
      case GradeEnum.pes:
        return (
          dark: const Color(0xFFFF8F00),
          light: const Color(0xFFFFF9C4),
        ); // Amber/Yellow
      case GradeEnum.mc:
        return (
          dark: const Color(0xFF3E2723),
          light: const Color(0xFFD7CCC8),
        ); // Brown
    }
  }
}

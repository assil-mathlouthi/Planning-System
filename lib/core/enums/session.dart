import 'package:flutter/widgets.dart';
import 'package:planning_system/core/utils/contants.dart';

enum SessionEnum {
  principale,
  partiel;

  static SessionEnum parseSession(String input) {
    final normalized = input.trim().toLowerCase();
    if (normalized.contains('principale') || normalized == 'p') {
      return SessionEnum.principale;
    }
    if (normalized.contains('partiel') || normalized == 'c') {
      return SessionEnum.partiel;
    }
    return SessionEnum.partiel;
  }

  ColorPair get colors {
    switch (this) {
      case principale:
        return (dark: const Color(0xFF1a1a1a), light: const Color(0xFFF0FDF4));
      case partiel:
        return (dark: const Color(0xFF1a1a1a), light: const Color(0xFFFFF7ED));
    }
  }

  String get getText {
    switch (this) {
      case principale:
        return "Principale";
      case partiel:
        return "Partiel";
    }
  }
}

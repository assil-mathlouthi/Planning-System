import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
  );

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    surface: Color(0xFFf8f9fa),
    onSurface: Color(0xFF717182),
    primary: Color(0xFF2c5aa0),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF1a1a1a),
    tertiary: Color(0xffdee2e6),
    error: Color(0xffdc3545),
  );
}

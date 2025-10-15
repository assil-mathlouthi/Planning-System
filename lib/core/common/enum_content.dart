// enum_content.dart
import 'package:flutter/material.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class EnumContent extends StatelessWidget {
  final Enum enumValue;
  const EnumContent({super.key, required this.enumValue});
  //TODO:Change enum colors according to design

  static final Map<Type, EnumConfig> _enumConfigs = {
    Grade: EnumConfig(
      colorBuilder: _getGradeColor,
      textBuilder: _getGradeDisplayText,
      fixedWidth: 80,
    ),
    Seance: EnumConfig(
      colorBuilder: _getSeanceColor,
      textBuilder: _getSeanceDisplayText,
      fixedWidth: 60,
    ),
    Session: EnumConfig(
      colorBuilder: _getSessionColor,
      textBuilder: _getSessionDisplayText,
      fixedWidth: 100,
    ),
    Semestre: EnumConfig(
      colorBuilder: _getSemestreColor,
      textBuilder: _getSemestreDisplayText,
      fixedWidth: 120,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final config = _enumConfigs[enumValue.runtimeType];

    if (config == null) {
      return _buildDefaultEnumWidget(context, enumValue);
    }

    final backgroundColor = config.colorBuilder(enumValue);
    final displayText = config.textBuilder(enumValue);

    return _buildEnumContainer(
      context: context,
      backgroundColor: backgroundColor,
      displayText: displayText,
      fixedWidth: config.fixedWidth,
    );
  }

  // ========== ENUM CONFIGURATIONS ==========
  static Color _getGradeColor(Enum enumValue) {
    final grade = enumValue as Grade;
    return switch (grade) {
      Grade.ac => Colors.yellow.shade100,
      Grade.ma => Colors.yellow.shade100,
      Grade.pr => Colors.yellow.shade100,
      Grade.as => Colors.yellow.shade100,
      Grade.ex => Colors.yellow.shade100,
      Grade.mc => Colors.yellow.shade100,
      Grade.pes => Colors.yellow.shade100,
      Grade.ptc => Colors.yellow.shade100,
      Grade.v => Colors.yellow.shade100,
      Grade.va => Colors.yellow.shade100,
    };
  }

  static String _getGradeDisplayText(Enum enumValue) {
    final grade = enumValue as Grade;
    return switch (grade) {
      Grade.ac => 'AC',
      Grade.ma => 'MA',
      Grade.pr => 'PR',
      Grade.as => 'AS',
      Grade.ex => 'EX',
      Grade.mc => 'MC',
      Grade.pes => 'PES',
      Grade.ptc => 'PTC',
      Grade.v => 'V',
      Grade.va => 'VA',
    };
  }

  static Color _getSeanceColor(Enum enumValue) => Colors.blue.shade50;
  static String _getSeanceDisplayText(Enum enumValue) =>
      'S${(enumValue as Seance).index + 1}';

  static Color _getSessionColor(Enum enumValue) {
    final session = enumValue as Session;
    return switch (session) {
      Session.controle => Color(0xffFFF7ED),
      Session.partiel => Color(0xffF0FDF4),
    };
  }

  static String _getSessionDisplayText(Enum enumValue) {
    final session = enumValue as Session;
    return switch (session) {
      Session.controle => 'Contrôle',
      Session.partiel => 'Partiele',
    };
  }

  static Color _getSemestreColor(Enum enumValue) {
    final semestre = enumValue as Semestre;
    return switch (semestre) {
      Semestre.sem1 => Colors.blue.shade200,
      Semestre.sem2 => Colors.green.shade200,
    };
  }

  static String _getSemestreDisplayText(Enum enumValue) =>
      'Semestre ${(enumValue as Semestre).index + 1}';

  // ========== WIDGET BUILDERS ==========
  Widget _buildDefaultEnumWidget(BuildContext context, Enum enumValue) {
    return _buildEnumContainer(
      context: context,
      backgroundColor: Colors.grey.shade100,
      displayText: enumValue.toString().split('.').last,
    );
  }

  Widget _buildEnumContainer({
    required BuildContext context,
    required Color backgroundColor,
    required String displayText,
    double? fixedWidth,
  }) {
    return Align(
      alignment: Alignment.centerLeft,
      widthFactor: 1.0, // makes width = child width
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: context.colors.tertiary),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(displayText, style: AppStyles.style12Regular(context)),
      ),
    );
  }
}

class EnumConfig {
  final Color Function(Enum) colorBuilder;
  final String Function(Enum) textBuilder;
  final double? fixedWidth;

  const EnumConfig({
    required this.colorBuilder,
    required this.textBuilder,
    this.fixedWidth,
  });
}

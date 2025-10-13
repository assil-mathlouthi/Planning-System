import 'package:flutter/material.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:flutter/widgets.dart';
import 'package:planning_system/core/utils/app_style.dart';

class CellContent extends StatelessWidget {
  final dynamic content;
  const CellContent({super.key, required this.content});
  
  // TODO: Change enum's widgets styles to be according the design
  // Enum widget factory registry
  static final Map<Type, Widget Function(Enum, BuildContext)>
  _enumWidgetFactories = {
    Grade: _buildGradeWidget,
    Seance: _buildSeanceWidget,
    Session: _buildSessionWidget,
    Semestre: _buildSemestreWidget,
  };

  // Color schemes for each enum type
  static final Map<Type, Color Function(Enum)> _enumColorSchemes = {
    Grade: _getGradeColor as Color Function(Enum),
    Seance: _getSeanceColor as Color Function(Enum),
    Session: _getSessionColor as Color Function(Enum),
    Semestre: _getSemestreColor as Color Function(Enum),
  };

  // Text display for each enum type
  static final Map<Type, String Function(Enum)> _enumDisplayText = {
    Grade: _getGradeDisplayText as String Function(Enum),
    Seance: _getSeanceDisplayText as String Function(Enum),
    Session: _getSessionDisplayText as String Function(Enum),
    Semestre: _getSemestreDisplayText as String Function(Enum),
  };

  @override
  Widget build(BuildContext context) {
    if (content is Enum) {
      return _buildEnumWidget(content as Enum, context);
    }

    if (content is Widget) {
      return content as Widget;
    }

    // Default content (non-enum, non-widget)
    return _buildDefaultWidget(context);
  }

  Widget _buildEnumWidget(Enum enumValue, BuildContext context) {
    final enumType = enumValue.runtimeType;

    // Get the appropriate factory or use default
    final widgetFactory =
        _enumWidgetFactories[enumType] ?? _buildDefaultEnumWidget;
    return widgetFactory(enumValue, context);
  }

  // ========== DEFAULT ENUM WIDGET ==========
  static Widget _buildDefaultEnumWidget(Enum enumValue, BuildContext context) {
    return _buildEnumContainer(
      context: context,
      backgroundColor: Colors.grey.shade100,
      displayText: enumValue.toString().split('.').last,
    );
  }

  // ========== GRADE WIDGET FACTORY ==========
  static Widget _buildGradeWidget(Enum enumValue, BuildContext context) {
    final grade = enumValue as Grade;
    return _buildEnumContainer(
      context: context,
      backgroundColor: _getGradeColor(grade),
      displayText: _getGradeDisplayText(grade),
    );
  }

  static Color _getGradeColor(Grade grade) {
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

  static String _getGradeDisplayText(Grade grade) {
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

  // ========== SEANCE WIDGET FACTORY ==========
  static Widget _buildSeanceWidget(Enum enumValue, BuildContext context) {
    final seance = enumValue as Seance;
    return _buildEnumContainer(
      context: context,
      backgroundColor: _getSeanceColor(seance),
      displayText: _getSeanceDisplayText(seance),
      fixedWidth: 60, // Fixed width for consistent sizing
    );
  }

  static Color _getSeanceColor(Seance seance) => Colors.blue.shade50;

  static String _getSeanceDisplayText(Seance seance) => 'S${seance.index + 1}';

  // ========== SESSION WIDGET FACTORY ==========
  static Widget _buildSessionWidget(Enum enumValue, BuildContext context) {
    final session = enumValue as Session;
    return _buildEnumContainer(
      context: context,
      backgroundColor: _getSessionColor(session),
      displayText: _getSessionDisplayText(session),
      fixedWidth: 100, // Fixed width for consistent sizing
    );
  }

  static Color _getSessionColor(Session session) {
    return switch (session) {
      Session.controle => Colors.blue.shade100,
      Session.partiel => Colors.red.shade100,
    };
  }

  static String _getSessionDisplayText(Session session) {
    return switch (session) {
      Session.controle => 'Contrôle',
      Session.partiel => 'Partiele',
    };
  }

  // ========== SEMESTRE WIDGET FACTORY ==========
  static Widget _buildSemestreWidget(Enum enumValue, BuildContext context) {
    final semestre = enumValue as Semestre;
    return _buildEnumContainer(
      context: context,
      backgroundColor: _getSemestreColor(semestre),
      displayText: _getSemestreDisplayText(semestre),
      fixedWidth: 120, // Fixed width for consistent sizing
    );
  }

  static Color _getSemestreColor(Semestre semestre) {
    return switch (semestre) {
      Semestre.sem1 => Colors.blue.shade200,
      Semestre.sem2 => Colors.green.shade200,
    };
  }

  static String _getSemestreDisplayText(Semestre semestre) =>
      'Semestre ${semestre.index + 1}';

  // ========== COMMON WIDGET BUILDER ==========
  static Widget _buildEnumContainer({
    required BuildContext context,
    required Color backgroundColor,
    required String displayText,
    double? fixedWidth,
  }) {
    final widget = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: context.colors.onPrimary.withValues(alpha: 0.3),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        displayText,
        style: AppStyles.style16Regular(
          context,
        ).copyWith(color: _getTextColorForBackground(backgroundColor)),
        textAlign: TextAlign.center,
      ),
    );

    // Apply fixed width if specified
    return fixedWidth != null
        ? SizedBox(width: fixedWidth, child: widget)
        : widget;
  }

  // ========== DEFAULT CONTENT WIDGET ==========
  Widget _buildDefaultWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Text(
        content?.toString() ?? 'N/A',
        style: AppStyles.style18Medium(
          context,
        ).copyWith(color: context.colors.secondary),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  // ========== TEXT COLOR CALCULATION ==========
  static Color _getTextColorForBackground(Color backgroundColor) {
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black87 : Colors.white;
  }
}

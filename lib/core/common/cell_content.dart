import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class CellContent extends StatelessWidget {
  final dynamic content;
  const CellContent({super.key, required this.content});

  Widget _buildEnumContent(Enum enumValue, BuildContext context) {
    Color getColorForEnum(Enum value) {
      // Handle different enum types
      //TODO: fix cell size for enum cells, (ki tabda Seance wla Session, tji el width mte3ha akbr millezm)
      //TODO: A3ti Colors hasb kol enum wo enum value
      //TODO: Add Actions White Box around svg
      if (value is Grade) {
        switch (value) {
          case Grade.ac:
            return Colors.yellow.shade100;
          case Grade.ma:
            return Colors.yellow.shade100;
          case Grade.pr:
            return Colors.yellow.shade100;
          case Grade.as:
            return Colors.yellow.shade100;
          case Grade.ex:
            return Colors.yellow.shade100;
          case Grade.mc:
            return Colors.yellow.shade100;
          case Grade.pes:
            return Colors.yellow.shade100;
          case Grade.ptc:
            return Colors.yellow.shade100;
          case Grade.v:
            return Colors.yellow.shade100;
          case Grade.va:
            return Colors.yellow.shade100;
        }
      } else if (value is Seance) {
        return Colors.blue.shade50;
      } else if (value is Session) {
        switch (value) {
          case Session.controle:
            return Colors.blue.shade100;
          case Session.partiel:
            return Colors.red.shade100;
        }
      }
      //  else if (value is Semestre) {
      //   switch (value) {
      //     case Semestre.sem1:
      //       return Colors.blue.shade200;
      //     case Semestre.sem2:
      //       return Colors.green.shade200;
      //   }
      // }
      return context.colors.onPrimary; // Default color
    }

    String getDisplayText(Enum value) {
      // Custom display text for each enum
      if (value is Grade) {
        switch (value) {
          case Grade.ac:
            return 'AC';
          case Grade.ma:
            return 'MA';
          case Grade.pr:
            return 'PR';
          case Grade.as:
            return 'AS';
          case Grade.ex:
            return 'EX';
          case Grade.mc:
            return 'MC';
          case Grade.pes:
            return 'PES';
          case Grade.ptc:
            return 'PTC';
          case Grade.v:
            return 'V';
          case Grade.va:
            return 'VA';
        }
      } else if (value is Seance) {
        return 'S${value.index + 1}'; // Shows S1, S2, etc.
      } else if (value is Session) {
        switch (value) {
          case Session.controle:
            return 'Contrôle';
          case Session.partiel:
            return 'Partiele';
        }
      } else if (value is Semestre) {
        return 'Semestre ${value.index + 1}';
      }
      return value.toString().split('.').last; // Fallback
    }

    return IntrinsicWidth(
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.only(top: 4, bottom: 4),
          decoration: BoxDecoration(
            color: getColorForEnum(enumValue),
            border: Border.all(
              color: context.colors.onPrimary.withValues(alpha: 0.3),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            getDisplayText(enumValue),
            style: AppStyles.style18Medium(context).copyWith(
              color: _getTextColorForBackground(getColorForEnum(enumValue)),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Color _getTextColorForBackground(Color backgroundColor) {
    // meme pas naarf chtaaml, zedha el chat
    // Calculate luminance to determine if text should be dark or light
    final luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black87 : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    if (content is Enum) {
      return _buildEnumContent(content as Enum, context);
    }

    if (content is Widget) {
      return content as Widget;
    }

    // Default content (non-enum, non-widget)
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
}

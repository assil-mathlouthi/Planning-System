// enum_content.dart
import 'package:flutter/material.dart';
import 'package:planning_system/core/common/enum_cell_container.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class EnumContent extends StatelessWidget {
  final Enum enumValue;
  const EnumContent({super.key, required this.enumValue});
  @override
  Widget build(BuildContext context) {
    if (enumValue is SemestreEnum) {
      final value = enumValue as SemestreEnum;
      return Text(
        value.getText,
        style: AppStyles.style14Regular(
          context,
        ).copyWith(color: context.colors.secondary),
      );
    }
    if (enumValue is GradeEnum) {
      final value = enumValue as GradeEnum;
      return EnumCellContainer(
        text: value.name.toUpperCase(),
        colorPair: value.colors,
      );
    }
    if (enumValue is SessionEnum) {
      final value = enumValue as SessionEnum;
      return EnumCellContainer(text: value.getText, colorPair: value.colors);
    }
    if (enumValue is SeanceEnum) {
      final value = enumValue as SeanceEnum;
      return EnumCellContainer(
        text: value.name.toUpperCase(),
        colorPair: value.colors,
      );
    }
    return Text(
      enumValue.name,
      style: AppStyles.style14Regular(
        context,
      ).copyWith(color: context.colors.secondary),
    );
  }
}

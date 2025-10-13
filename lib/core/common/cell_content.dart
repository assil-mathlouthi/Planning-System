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
  Widget ReturnByEnum(Enum enumValue, BuildContext context) {
    BoxDecoration variable = BoxDecoration(color: Colors.white);
    if (enumValue is Grade) {
      variable = BoxDecoration(
        color: context.colors.onPrimaryFixed,
        border: Border.all(color: context.colors.onPrimary),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      );
    } else if (enumValue is Seance) {
      variable = BoxDecoration(
        color: context.colors.onPrimaryFixed,
        border: Border.all(color: context.colors.onPrimary),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      );
    } else if (enumValue is Session) {
      variable = BoxDecoration(
        color: context.colors.onPrimaryFixed,
        border: Border.all(color: context.colors.onPrimary),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      );
    } else if (enumValue is Semestre) {
      variable = BoxDecoration(
        color: context.colors.onPrimaryFixed,
        border: Border.all(color: context.colors.onPrimary),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      );
    }
    return Container(decoration: variable, child: Text(content.toString()));
  }

  @override
  Widget build(BuildContext context) {
    if (content is Enum) {
      print(content);
      return ReturnByEnum(content, context);
    }
    if (content is Widget) {
      return content;
    } else {
      return Text(
        content.toString(),
        style: AppStyles.style16Regular(
          context,
        ).copyWith(color: context.colors.secondary),
      );
    }
  }
}

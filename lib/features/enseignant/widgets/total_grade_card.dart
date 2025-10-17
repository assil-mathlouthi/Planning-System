import 'package:flutter/material.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class TotalGradeCard extends StatelessWidget {
  const TotalGradeCard({super.key, required this.total, required this.grade});

  final int total;
  final GradeEnum grade;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: grade.colors.light,
        border: Border.all(color: context.colors.tertiary),
      ),
      child: Text(
        "$total",
        textAlign: TextAlign.center,
        style: AppStyles.style16Regular(
          context,
        ).copyWith(color: grade.colors.dark),
      ),
    );
  }
}

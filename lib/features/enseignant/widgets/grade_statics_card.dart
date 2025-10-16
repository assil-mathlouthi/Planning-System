import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/enseignant/models/grade_stat_model.dart';
import 'package:planning_system/features/enseignant/widgets/total_grade_card.dart';

class GradeStaticsCard extends StatelessWidget {
  const GradeStaticsCard({super.key, required this.model});
  final GradeStatModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colors.onPrimary,
        border: Border.all(color: context.colors.tertiary),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.gradeEnum.name.toUpperCase(),
                style: AppStyles.style16Bold(context),
              ),
              TotalGradeCard(total: model.total, grade: model.gradeEnum),
            ],
          ),
          42.h,
          8.h,
          _buildRow(
            context,
            "Participants:",
            model.participants.toString(),
            Color(0xff28A745),
          ),
          8.h,
          _buildRow(
            context,
            "nb heure:",
            model.nbHours.toString(),
            Color(0xff2C5AA0),
          ),
        ],
      ),
    );
  }

  Row _buildRow(
    BuildContext context,
    String property,
    String value,
    Color color,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(property, style: AppStyles.style16Regular(context)),
        Text(
          value,
          style: AppStyles.style16Regular(context).copyWith(color: color),
        ),
      ],
    );
  }
}

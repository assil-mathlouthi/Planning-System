import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';

class GradeStaticsCard extends StatelessWidget {
  const GradeStaticsCard({super.key});

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
          Text("PR", style: AppStyles.style16Regular(context).copyWith(
            color: context.colors.secondary,
          )),
          42.h,
          _buildRow(context, "Total:", "8"),
          8.h,
          _buildRow(context, "Participants:", "4"),
          8.h,
          _buildRow(context, "nb heure:", "8"),
        ],
      ),
    );
  }

  Row _buildRow(BuildContext context, String property, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(property, style: AppStyles.style16Regular(context)),
        Text(value, style: AppStyles.style16Regular(context)),
      ],
    );
  }
}

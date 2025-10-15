import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class PlanningCard extends StatelessWidget {
  final int number;
  final String text;
  const PlanningCard({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: context.colors.onPrimary,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Text(
              "$number",
              style: AppStyles.style14Regular(
                context,
              ).copyWith(color: Colors.green),
            ),
            Text(
              text,
              style: AppStyles.style14Regular(
                context,
              ).copyWith(color: context.colors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

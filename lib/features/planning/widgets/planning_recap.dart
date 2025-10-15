import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/planning/widgets/planning_recap_table.dart';

class PlanningRecap extends StatelessWidget {
  const PlanningRecap({super.key});
  //TODO: Make this change dynamically with the buttons pressed "Par Séance/ Planning Complet etc"
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.onPrimary,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Récapitulatif par séance",
            style: AppStyles.style16Regular(
              context,
            ).copyWith(color: context.colors.secondary),
          ),
          30.h,
          PlanningRecapTable(),
        ],
      ),
    );
  }
}

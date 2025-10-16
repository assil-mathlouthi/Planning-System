import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/planning/widgets/planning_recap_table.dart';

class PlanningRecap extends StatelessWidget {
  const PlanningRecap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: context.colors.onPrimary,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: BoxBorder.all(color: context.colors.tertiary),
      ),
      child: Column(children: [PlanningRecapTable()]),
    );
  }
}

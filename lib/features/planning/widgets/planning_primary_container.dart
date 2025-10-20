import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/planning/widgets/planning_button_list.dart';
import 'package:planning_system/features/planning/widgets/planning_recap_table.dart';

class PlanningPrimaryContainer extends StatelessWidget {
  const PlanningPrimaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: [
        PlanningButtonList(),
        Container(
          padding: EdgeInsets.all(24),
          decoration: _buildDecoration(context),
          child: PlanningRecapTable(),
        ),
      ],
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.colors.onPrimary,
      borderRadius: BorderRadius.all(Radius.circular(12)),
      border: BoxBorder.all(color: context.colors.tertiary),
    );
  }
}

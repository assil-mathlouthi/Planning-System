import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/planning/widgets/planning_header.dart';
import 'package:planning_system/features/planning/widgets/planning_primary_container.dart';

class PlanningViewBody extends StatelessWidget {
  const PlanningViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: context.colors.surface,
      child: SingleChildScrollView(
        child: Column(
          spacing: 24,
          children: [PlanningHeader(), PlanningPrimaryContainer()],
        ),
      ),
    );
  }
}

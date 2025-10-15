import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/planning/widgets/planning_view_body.dart';

class PlanningView extends StatelessWidget {
  const PlanningView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PlanningViewBody(),
      backgroundColor: context.colors.surface,
    );
  }
}

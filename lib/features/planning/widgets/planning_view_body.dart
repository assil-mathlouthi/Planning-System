import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/features/planning/widgets/planning_card_list.dart';
import 'package:planning_system/features/planning/widgets/planning_header.dart';
import 'package:planning_system/features/planning/widgets/planning_primary_container.dart';

class PlanningViewBody extends StatelessWidget {
  const PlanningViewBody({super.key});
  //TODO: handle onpressed function
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      color: context.colors.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PlanningHeader(),
          24.h,
          PlanningPrimaryContainer(),
          24.h,
          PlanningCardList(),
        ],
      ),
    );
  }
}

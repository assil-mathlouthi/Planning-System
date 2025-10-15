import 'package:flutter/material.dart';

import 'package:planning_system/features/planning/widgets/planning_button_list.dart';
import 'package:planning_system/features/planning/widgets/planning_recap.dart';

class PlanningPrimaryContainer extends StatelessWidget {
  const PlanningPrimaryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [PlanningButtonList(), PlanningRecap()]);
  }
}

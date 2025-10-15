import 'package:flutter/material.dart';
import 'package:planning_system/features/planning/widgets/planning_card.dart';

class PlanningCardList extends StatelessWidget {
  const PlanningCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PlanningCard(text: "Exam Planifiées", number: 5),
        SizedBox(width: 24),
        PlanningCard(text: "Exam Planifiées", number: 5),
        SizedBox(width: 24),
        PlanningCard(text: "Exam Planifiées", number: 5),
        SizedBox(width: 24),
      ],
    );
  }
}

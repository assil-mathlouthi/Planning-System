import 'package:flutter/material.dart';
import 'package:planning_system/features/enseignant/widgets/grade_statics_card.dart';

class GradeStatistics extends StatelessWidget {
  const GradeStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 16,
        children: [
          GradeStaticsCard(),
          GradeStaticsCard(),
          GradeStaticsCard(),
          GradeStaticsCard(),
          GradeStaticsCard(),
        ],
      ),
    );
  }
}

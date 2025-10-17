import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/features/enseignant/controllers/enseignant_controller.dart';
import 'package:planning_system/features/enseignant/widgets/grade_statics_card.dart';

class GradeStatistics extends GetView<EnseignantController> {
  const GradeStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.gradeStatsStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final grades = snapshot.data!;
        if (grades.isEmpty) {
          return const Center(child: Text('Aucune statistique'));
        }
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 16,
            children: grades.map((e) => GradeStaticsCard(model: e)).toList(),
          ),
        );
      },
    );
  }
}

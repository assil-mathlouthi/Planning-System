import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/features/enseignant/controllers/enseignant_controller.dart';
import 'package:planning_system/features/enseignant/widgets/grade_statics_card.dart';

class GradeStatistics extends GetView<EnseignantController> {
  const GradeStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.grades.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GradeStaticsCard(model: controller.grades[index]);
        },
        separatorBuilder: (context, index) => 16.w,
      ),
    );
  }
}

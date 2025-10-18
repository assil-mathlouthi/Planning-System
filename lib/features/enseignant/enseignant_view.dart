import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/enseignant/controllers/enseignant_controller.dart';
import 'package:planning_system/features/enseignant/widgets/eneigant_header.dart';
import 'package:planning_system/features/enseignant/widgets/enseignant_main_content.dart';
import 'package:planning_system/features/enseignant/widgets/grade_statistics.dart';
import 'package:planning_system/core/controller/table_controller.dart';

class EnseignantView extends GetView<EnseignantController> {
  const EnseignantView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TableController(), tag: "Ens");
    return Container(
      color: context.colors.surface,
      padding: EdgeInsetsGeometry.all(32),
      child: SingleChildScrollView(
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EneigantHeader(),
            GradeStatistics(),
            EnseignantMainContent(),
          ],
        ),
      ),
    );
  }
}

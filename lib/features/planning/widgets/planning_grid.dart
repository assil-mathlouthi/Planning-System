import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/features/planning/controllers/planning_recap_controller.dart';
import 'package:planning_system/features/planning/widgets/planning_grid_cell.dart';

class PlanningGrid extends GetView<PlanningRecapController> {
  const PlanningGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.planningGridStream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data != null) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 1000;
              final crossAxisCount = isWide ? 4 : 3;
              final mainAxisSpacing = isWide ? 16.0 : 12.0;
              final crossAxisSpacing = isWide ? 16.0 : 12.0;
              final childAspectRatio = isWide ? 1.65 : 1.35;

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: mainAxisSpacing,
                  crossAxisSpacing: crossAxisSpacing,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return PlanningGridCell(model: data[index]);
                },
              );
            },
          );
        }
        return const LinearProgressIndicator();
      },
    );
  }
}

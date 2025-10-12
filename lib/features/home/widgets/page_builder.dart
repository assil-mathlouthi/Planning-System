import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/features/enseigant/enseigant_view.dart';
import 'package:planning_system/features/generation/generation_view.dart';
import 'package:planning_system/features/home/controllers/navigation_controller.dart';
import 'package:planning_system/features/dashboard/dashboard_view.dart';
import 'package:planning_system/features/parametres/parametres_view.dart';
import 'package:planning_system/features/planning/planning_view.dart';
import 'package:planning_system/features/voeux/views/voeux_view.dart';

class PageBuilder extends GetView<NavigationController> {
  const PageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return IndexedStack(
        index: controller.currentIndex.value,
        children: [
          // TODO : this partter I think is not efficient but I don't have time to write a work around
          // if you still have time change it later
          DashboardView(),
          EnseigantView(),
          VoeuxView(),
          GenerationView(),
          PlanningView(),
          ParametresView(),
        ],
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:planning_system/features/enseignant/enseignant_view.dart';
import 'package:planning_system/features/generation/generation_view.dart';
import 'package:planning_system/features/home/controllers/navigation_controller.dart';
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
         
          EnseignantView(),
          VoeuxView(),
          GenerationView(),
          PlanningView(),
        ],
      );
    });
  }
}

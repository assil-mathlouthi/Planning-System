import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/home/controllers/navigation_controller.dart';
import 'package:planning_system/features/home/models/side_navigation_item_model.dart';
import 'package:planning_system/features/home/widgets/active_side_navigation_item.dart';
import 'package:planning_system/features/home/widgets/inactive_side_navigation_item.dart';

class SideNavigationItem extends GetView<NavigationController> {
  const SideNavigationItem({
    super.key,
    required this.index,
    required this.model,
  });

  final int index;
  final SideNavigationItemModel model;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
        
          controller.updateCurrentIndex(index: index);
        },
        hoverColor: context.colors.onPrimaryContainer,
        borderRadius: BorderRadius.circular(8),
        child: controller.currentIndex.value == index
            ? ActiveSideNavigationItem(model: model)
            : InactiveSideNavigationItem(model: model),
      );
    });
  }
}

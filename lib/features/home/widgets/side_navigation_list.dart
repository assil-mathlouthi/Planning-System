import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/home/controllers/navigation_controller.dart';
import 'package:planning_system/features/home/widgets/active_side_navigation_item.dart';
import 'package:planning_system/features/home/widgets/inactive_side_navigation_item.dart';

class SideNavigationList extends GetView<NavigationController> {
  const SideNavigationList({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final model = controller.items[index];
          return InkWell(
            onTap: () {},
            hoverColor: context.colors.onPrimaryContainer,
            borderRadius: BorderRadius.circular(8),
            child: model.isActive
                ? ActiveSideNavigationItem(model: model)
                : InactiveSideNavigationItem(model: model),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 4),
      ),
    );
  }
}

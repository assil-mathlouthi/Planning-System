import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/home/controllers/navigation_controller.dart';
import 'package:planning_system/features/home/widgets/side_navigation_item.dart';

import 'package:planning_system/core/extensions/gap_with_sized_box.dart';

class SideNavigationList extends GetView<NavigationController> {
  const SideNavigationList({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _buildDecoration(context),
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final model = controller.items[index];
          return SideNavigationItem(index: index, model: model);
        },
        separatorBuilder: (context, index) => 6.h,
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border(
        right: BorderSide(color: context.colors.tertiary),
        bottom: BorderSide(color: context.colors.tertiary),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/home/models/side_navigation_item_model.dart';
import 'package:planning_system/features/home/widgets/active_side_navigation_item.dart';
import 'package:planning_system/features/home/widgets/inactive_side_navigation_item.dart';

class SideNavigationList extends StatelessWidget {
  const SideNavigationList({super.key});
  static List<SideNavigationItemModel> items = [
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
      isActive: true,
    ),
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
    ),
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
    ),
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
    ),
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final model = items[index];
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

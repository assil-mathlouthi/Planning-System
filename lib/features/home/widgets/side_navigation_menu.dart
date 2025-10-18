import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/home/widgets/app_logo.dart';
import 'package:planning_system/features/home/widgets/bottom_navigation_menu_widget.dart';
import 'package:planning_system/features/home/widgets/side_navigation_list.dart';

class SideNavigationMenu extends StatelessWidget {
  const SideNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.onPrimary,
      child: Column(
        children: [
          AppLogo(),
          Expanded(child: SideNavigationList()),
          BottomNavigationMenuWidget(),
        ],
      ),
    );
  }
}

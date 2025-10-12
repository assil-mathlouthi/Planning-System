import 'package:flutter/material.dart';
import 'package:planning_system/features/home/widgets/app_logo.dart';
import 'package:planning_system/features/home/widgets/side_navigation_list.dart';

class SideNavigationMenu extends StatelessWidget {
  const SideNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [AppLogo(), SideNavigationList()]);
  }
}

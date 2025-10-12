import 'package:flutter/material.dart';
import 'package:planning_system/features/home/widgets/side_navigation_menu.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SideNavigationMenu()),
        Expanded(child: Container(color: Colors.white)),
      ],
    );
  }
}

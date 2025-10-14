import 'package:flutter/material.dart';
import 'package:planning_system/features/home/widgets/page_builder.dart';
import 'package:planning_system/features/home/widgets/side_navigation_menu.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 260, child: SideNavigationMenu()),
        // Expanded(child: Container(color: Colors.white)),
        Expanded(child: PageBuilder()),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planning_system/features/home/widgets/app_logo.dart';

class SideNavigationMenu extends StatelessWidget {
  const SideNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AppLogo(),
      ],
    );
  }
}
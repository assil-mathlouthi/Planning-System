import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/planning/widgets/tab_button.dart';

class PlanningButtonList extends StatelessWidget {
  const PlanningButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: context.colors.tertiary,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: TabBar(
          padding: EdgeInsets.symmetric(vertical: 3.5, horizontal: 3),
          indicatorSize: TabBarIndicatorSize.tab,
          tabAlignment: TabAlignment.center,
          indicator: BoxDecoration(
            color: context.colors.onPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          indicatorWeight: 0,
          dividerColor: Colors.transparent,
          tabs: [
            TabButton(text: "Par Séance"),
            TabButton(text: "Par Enseignant"),
          ],
        ),
      ),
    );
  }
}

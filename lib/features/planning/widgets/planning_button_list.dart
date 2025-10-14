import 'package:flutter/material.dart';
import 'package:planning_system/core/common/secondary_button.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';

class PlanningButtonList extends StatelessWidget {
  const PlanningButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: context.colors.tertiary,

          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SecondaryButton(
              text: "Par Séance",
              isActive: true,
              onpressed: () {},
            ),
            SecondaryButton(text: "Planning Complet", onpressed: () {}),
            SecondaryButton(text: "Par Enseignant", onpressed: () {}),
          ],
        ),
      ),
    );
  }
}

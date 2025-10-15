import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class TabButton extends StatelessWidget {
  //TODO: kifeh yetbadl el isActive waktili onclick wo
  //tetna7a ki click ala button ekher
  final String text;

  const TabButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
            style: AppStyles.style14Regular(
              context,
            ).copyWith(color: context.colors.secondary),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

class PlanningHeader extends StatelessWidget {
  const PlanningHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Planning du surveillance",
              style: AppStyles.style24Regular(
                context,
              ).copyWith(color: context.colors.secondary),
            ),
            Text(
              "Consulter et exporter le planning final",
              style: AppStyles.style16Regular(
                context,
              ).copyWith(color: context.colors.onSurface),
            ),
            // PlanningPrimaryContainer(),
          ],
        ),
        Row(
          children: [
            PrimaryButton(
              icon: Assets.iconsPdf,
              text: "Export PDF",
              onpressed: () {},
            ),
            PrimaryButton(
              icon: Assets.iconsExcel,
              text: "Export Excel",
              onpressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

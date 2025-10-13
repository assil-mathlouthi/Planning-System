import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/generation/widgets/rules_list_tile.dart';

class SecondaryGenerationViewContainer extends StatelessWidget {
  const SecondaryGenerationViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(context),
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Paramètres de génération",
            style: AppStyles.style16Regular(
              context,
            ).copyWith(color: context.colors.secondary),
          ),
          22.h,
          RulesListTile(
            title: "Respect des préférences",
            subTitle: "Priorité aux vœux des enseignants",
            icon: Assets.iconsRule,
          ),
          RulesListTile(
            title: "Charge équilibrée",
            subTitle: "Distribution équitable",
            icon: Assets.iconsRule,
          ),
          RulesListTile(
            title: "Pas de conflits",
            subTitle: "Éviter les doubles affectations",
            icon: Assets.iconsRule,
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      color: context.colors.onPrimary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: context.colors.tertiary),
      
    );
  }
}

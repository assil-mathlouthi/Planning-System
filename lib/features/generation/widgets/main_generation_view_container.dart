import 'package:flutter/material.dart';
import 'package:planning_system/core/common/important_widget.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/generation/widgets/parameter_button.dart';
import 'package:planning_system/features/generation/widgets/parameter_container.dart';

class MainGenerationViewContainer extends StatelessWidget {
  const MainGenerationViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: _decoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Paramètres de génération",
            style: AppStyles.style16Regular(
              context,
            ).copyWith(color: context.colors.secondary),
          ),
          32.h,
          ParameterContainer(
            title: "Enseignants",
            subtitle: "Aucune donnée importée",
            importTap: () {},
          ),
          16.h,
          ParameterContainer(
            title: "Enseignants",
            subtitle: "Aucune donnée importée",
            importTap: () {},
          ),
          16.h,
          ParameterContainer(
            title: "Enseignants",
            subtitle: "Aucune donnée importée",
            importTap: () {},
          ),
          24.h,
          ImportantWidget(
            title: "Données manquantes",
            subTitle:
                "Veuillez importer tous les fichiers requis (enseignants, examens et vœux) avant de générer le planning.",
          ),
          24.h,
          Divider(height: 0, color: context.colors.tertiary),
          17.h,
          ParameterButton(
            icon: Assets.iconsGenerer,
            text: "Générer le planning",
            bgColor: context.colors.primary,
            textColor: context.colors.onPrimary,
            onTap: () {},
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

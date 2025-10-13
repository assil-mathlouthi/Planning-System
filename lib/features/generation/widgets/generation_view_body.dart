import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/generation/widgets/main_generation_view_container.dart';
import 'package:planning_system/features/generation/widgets/secondary_generation_view_container.dart';

class GenerationViewBody extends StatelessWidget {
  const GenerationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Génération du planning",
            style: AppStyles.style24Regular(
              context,
            ).copyWith(color: context.colors.secondary),
          ),
          Text(
            "Générer automatiquement le planning de surveillance",
            style: AppStyles.style16Regular(
              context,
            ).copyWith(color: context.colors.onSurface),
          ),
          SizedBox(height: 24),
          IntrinsicHeight(
            child: Row(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: MainGenerationViewContainer()),
                Expanded(child: SecondaryGenerationViewContainer()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

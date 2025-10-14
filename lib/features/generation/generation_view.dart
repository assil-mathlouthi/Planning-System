import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/generation/widgets/generation_view_body.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/generation/widgets/regles_generation.dart';
import 'package:planning_system/features/generation/widgets/regles_parametres.dart';

class GenerationView extends StatelessWidget {
  const GenerationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            style: AppStyles.style18Regular(context),
            "Génération du planning",
          ),
          Text(
            style: AppStyles.style16Regular(context),
            "Générer automatiquement le planning de surveillance",
          ),
          Row(

            children: [ReglesParametres(), ReglesGeneration()],
          ),
        ],
      ),
    );
  }
}

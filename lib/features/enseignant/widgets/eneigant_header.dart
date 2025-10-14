import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/enseignant/widgets/enseignant_buttons.dart';

class EneigantHeader extends StatelessWidget {
  const EneigantHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 80,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Gestion des enseignants",
              style: AppStyles.style24Regular(
                context,
              ).copyWith(color: context.colors.secondary),
            ),
            Text(
              "Gérer les préférences et disponibilités des enseignants",
              style: AppStyles.style16Regular(
                context,
              ).copyWith(color: context.colors.onSurface),
            ),
          ],
        ),

        Expanded(child: EnseignantButtons()),
      ],
    );
  }
}

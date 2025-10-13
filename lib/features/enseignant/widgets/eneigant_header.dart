import 'package:flutter/material.dart';
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
              style: AppStyles.style24Medium(context),
            ),
            Text(
              style: AppStyles.style16Regular(context),
              "Gérer les préférences et disponibilités des enseignants",
            ),
          ],
        ),

        Expanded(child: EnseignantButtons()),
      ],
    );
  }
}

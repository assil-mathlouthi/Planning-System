import 'package:flutter/material.dart';
import 'package:planning_system/core/common/rechercher_input.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/voeux/widgets/voeux_table_liste.dart';

class VoeuxTable extends StatelessWidget {
  const VoeuxTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          style: AppStyles.style16Regular(context),
          "Liste des voeux importés",
        ),
        SizedBox(height: 16),
        RechercherInput(item: "voeu"),
        SizedBox(height: 16),
        VoeuxTableListe(),
      ],
    );
  }
}

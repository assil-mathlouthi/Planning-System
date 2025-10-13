import 'package:flutter/material.dart';
import 'package:planning_system/core/common/rechercher_input.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/voeux/widgets/voeux_table_liste.dart';

class VoeuxTable extends StatelessWidget {
  const VoeuxTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.onPrimary,
        border: Border.all(color: context.colors.surface, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.all(24),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            style: AppStyles.style18Regular(context),
            "Liste des voeux importés",
          ),
          SizedBox(height: 16),
          RechercherInput(item: "voeu"),
          SizedBox(height: 16),
          VoeuxTableListe(),
        ],
      ),
    );
  }
}

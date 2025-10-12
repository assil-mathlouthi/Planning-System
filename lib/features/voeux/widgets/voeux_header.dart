import 'package:flutter/material.dart';
import 'package:planning_system/core/utils/app_style.dart';

class voeuxHeader extends StatelessWidget {
  const voeuxHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: AppStyles.style20Medium(context),

              "Voeux de surveillance",
            ),
            Text("Gérer les préférences et disponibilités des enseignants"),
          ],
        ),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Télecharger Modèle")),
            ElevatedButton(onPressed: () {}, child: Text("Importer Excel")),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planning_system/core/utils/app_style.dart';

class VoeuxHeader extends StatelessWidget {
  const VoeuxHeader({super.key});

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
            Text(
              style: AppStyles.style16Regular(context),
              "Gérer les préférences et disponibilités des enseignants",
            ),
          ],
        ),
        Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                iconColor: Colors.black,
                side: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(50, 40),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.download),
                  SizedBox(width: 10),
                  Text("Télecharger Modèle"),
                ],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                iconColor: Colors.black,
                side: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                minimumSize: Size(50, 40),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.upload),
                  SizedBox(width: 10),
                  Text("Importer Excel"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

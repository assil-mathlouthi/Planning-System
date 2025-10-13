import 'package:flutter/material.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

import 'package:planning_system/core/extensions/gap_with_sized_box.dart';

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
              style: AppStyles.style24Medium(context),
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
            PrimaryButton(
              icon: Assets.iconsDownload,
              text: "Télecharger Modèle",
              onpressed: () {},
            ),
            10.w,
            PrimaryButton(
              icon: Assets.iconsUpload,
              text: "Importer Excel",
              onpressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}

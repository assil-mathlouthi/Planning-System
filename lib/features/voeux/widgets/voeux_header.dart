import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/voeux/controllers/voeux_controller.dart';

import 'package:planning_system/core/extensions/gap_with_sized_box.dart';

class VoeuxHeader extends GetView<VoeuxController> {
  const VoeuxHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              style: AppStyles.style24Medium(
                context,
              ).copyWith(color: context.colors.secondary),
              "Voeux de surveillance",
            ),
            Text(
              style: AppStyles.style16Regular(context),
              "Gérer les préférences et disponibilités des enseignants",
            ),
          ],
        ),
        Spacer(),
        PrimaryButton(
          icon: Assets.iconsDownload,
          text: "Télecharger Modèle",
          onpressed: () async {
            await controller.exportVoeux();
          },
        ),
        10.w,
        PrimaryButton(
          icon: Assets.iconsUpload,
          text: "Importer Excel",
          onpressed: () async {
            await controller.insertAllVoeux();
          },
        ),
      ],
    );
  }
}

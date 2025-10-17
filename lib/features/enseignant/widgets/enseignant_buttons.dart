import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/enseignant/controllers/enseignant_controller.dart';

class EnseignantButtons extends GetView<EnseignantController> {
  const EnseignantButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      runSpacing: 8,
      spacing: 8,
      children: [
        PrimaryButton(
          icon: Assets.iconsDownload,
          text: "Télécharger modèle",
          onpressed: () async {},
        ),
        PrimaryButton(
          icon: Assets.iconsUpload,
          text: "Importer Excel",
          onpressed: () async {
            await controller.insertAllEnseignant();
          },
        ),
        PrimaryButton(
          icon: Assets.iconsAdd,
          text: "Ajouter un enseignant",
          isActive: true,
          onpressed: () {},
        ),
      ],
    );
  }
}

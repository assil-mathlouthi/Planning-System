import 'package:flutter/material.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/utils/assets.dart';

class EnseignantButtons extends StatelessWidget {
  const EnseignantButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      runSpacing: 8,
      spacing: 8,
      children: [
        PrimaryButton(
          icon: Assets.iconsSettings,
          text: "Surveillances par grade",
          onpressed: () {},
        ),
        PrimaryButton(
          icon: Assets.iconsDownload,
          text: "Télécharger modèle",
          onpressed: () {},
        ),
        PrimaryButton(
          icon: Assets.iconsUpload,
          text: "Importer Excel",
          onpressed: () {},
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

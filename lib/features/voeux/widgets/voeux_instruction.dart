import 'package:flutter/material.dart';
import 'package:planning_system/core/common/information_widget.dart';
import 'package:planning_system/core/utils/assets.dart';

class VoeuxInstruction extends StatelessWidget {
  const VoeuxInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, top: 16, right: 12, bottom: 16),
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 137, 240, 0.098),
        border: Border.all(color: const Color.fromARGB(255, 66, 165, 245)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      /* ki fama design */
      child: InformationWidget(
        sentence:
            "Importez les souhaits de surveillance des enseignants depuis un fichier Excel. Le fichier doit contenir : nom, prénom, session, semestre, niveau et séance.",
        icon: Assets.iconsInfo,
      ),
    );
  }
}

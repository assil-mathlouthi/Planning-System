import 'package:flutter/material.dart';

class voeuxInstruction extends StatelessWidget {
  const voeuxInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Icon(Icons.info),
        Text(
          "Importer les souhaits de surveillance des enseignants depuis un fichier Excel. Le fichier doit contenir : nom, prenom, session, semestre, niveau et séance.",
        ),
      ],
    );
  }
}

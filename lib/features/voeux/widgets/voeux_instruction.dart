import 'package:flutter/material.dart';

class VoeuxInstruction extends StatelessWidget {
  const VoeuxInstruction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(69, 137, 240, 0.098),
        border: Border.all(color: const Color.fromARGB(255, 66, 165, 245)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      /* ki fama design */
      child: Row(
        children: [
          Icon(Icons.info_outline),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Importer les souhaits de surveillance des enseignants depuis un fichier Excel. Le fichier doit contenir : nom, prenom, session, semestre, niveau et séance.",
            ),
          ),
        ],
      ),
    );
  }
}

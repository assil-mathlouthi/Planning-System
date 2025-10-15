import 'package:flutter/material.dart';
import 'package:planning_system/core/common/generic_table.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';

class VoeuxTableListe extends StatelessWidget {
  const VoeuxTableListe({super.key});

  @override
  Widget build(BuildContext context) {
    return GenerateTable(
      hasDownloadButton: true,
      instanceList: [
        {
          "semestre": Semestre.sem1,
          "session": Session.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": Seance.s2,
        },
        {
          "semestre": Semestre.sem1,
          "session": Session.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": Seance.s2,
        },
        {
          "semestre": Semestre.sem1,
          "session": Session.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": Seance.s2,
        },
      ],
    );
  }
}

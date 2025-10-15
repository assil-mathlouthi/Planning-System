import 'package:flutter/material.dart';
import 'package:planning_system/core/common/custom_table.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';

class VoeuxTableListe extends StatelessWidget {
  const VoeuxTableListe({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTable(
      instanceList: [
        {
          "semestre": SemestreEnum.sem1,
          "session": SessionEnum.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": SeanceEnum.s2,
        },
        {
          "semestre": SemestreEnum.sem1,
          "session": SessionEnum.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": SeanceEnum.s2,
        },
        {
          "semestre": SemestreEnum.sem1,
          "session": SessionEnum.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": SeanceEnum.s2,
        },
      ],
    );
  }
}

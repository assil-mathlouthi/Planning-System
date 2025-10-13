import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/common/generic_table.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/voeux/models/voeux_item_model.dart';

class VoeuxTableListe extends StatelessWidget {
  const VoeuxTableListe({super.key});

  @override
  Widget build(BuildContext context) {
    var test = GenerateTable(
      instanceList: [
        {
          "semestre": Semestre.sem1,
          "session": Session.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": Seance.s2,
          "actions": SvgPicture.asset(Assets.iconsTrash, height: 18),
        },
        {
          "semestre": Semestre.sem1,
          "session": Session.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": Seance.s2,
          "actions": SvgPicture.asset(Assets.iconsTrash, height: 18),
        },
        {
          "semestre": Semestre.sem1,
          "session": Session.controle,
          "codeSmartexEns": 1,
          "jour": 5,
          "seance": Seance.s2,
          "actions": SvgPicture.asset(Assets.iconsTrash, height: 18),
        },
      ],
    );
    return test;
  }
}

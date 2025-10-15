import 'package:flutter/material.dart';
import 'package:planning_system/core/common/custom_table.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/utils/assets.dart';

class PlanningRecapTable extends StatelessWidget {
  //make it take content accordingly
  const PlanningRecapTable({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTable(
      instanceList: [
        {
          "seance": Seance.s1,
          "date": DateTime.now(),
          "semestre": Semestre.sem1,
          "nb Examen": 5,
          "nb Surveillants": 3,
          "actions": PrimaryButton(
            icon: Assets.iconsDownload,
            text: "Télecharger affectations",
            onpressed: () {},
          ),
        },
        {
          "seance": Seance.s1,
          "date": DateTime.now(),
          "semestre": Semestre.sem1,
          "nb Examen": 5,
          "nb Surveillants": 3,
          "actions": PrimaryButton(
            icon: Assets.iconsDownload,
            text: "Télecharger affectations",
            onpressed: () {},
          ),
        },
        {
          "seance": Seance.s1,
          "date": DateTime.now(),
          "semestre": Semestre.sem1,
          "nb Examen": 5,
          "nb Surveillants": 3,
          "actions": PrimaryButton(
            icon: Assets.iconsDownload,
            text: "Télecharger affectations",
            onpressed: () {},
          ),
        },
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PlanningRecapTable extends StatelessWidget {
  //make it take content accordingly
  const PlanningRecapTable({super.key});

  @override
  Widget build(BuildContext context) {
    var zah = [
      {
        "seance": Seance.s1,
        "date": DateTime.now(),
        "semestre": Semestre.sem1,
        "nb Examen": 5,
        "nb Surveillants": 3,
      },
      {
        "seance": Seance.s1,
        "date": DateTime.now(),
        "semestre": Semestre.sem1,
        "nb Examen": 5,
        "nb Surveillants": 3,
      },
      {
        "seance": Seance.s1,
        "date": DateTime.now(),
        "semestre": Semestre.sem1,
        "nb Examen": 5,
        "nb Surveillants": 3,
      },
    ];
    return SizedBox(
      height: 300,
      child: TabBarView(
        children: [
          GenerateTable(instanceList: zah),
          GenerateTable(instanceList: zah),
        ],
      ),
    );
  }
}

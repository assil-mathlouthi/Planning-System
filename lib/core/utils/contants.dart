import 'dart:ui';

import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';

const kWindowSize = Size(1100, 700);

const kgradesData = <Grade>[
  Grade(codeGrade: GradeEnum.pr,  label: 'Professeur',                      nbHeure: 8.0),
  Grade(codeGrade: GradeEnum.ma,  label: 'Maitre Assistant',                nbHeure: 6.0),
  Grade(codeGrade: GradeEnum.v,   label: 'Vacataire',                       nbHeure: 3.0),
  Grade(codeGrade: GradeEnum.ptc, label: 'Prof. Technologique Contractuel', nbHeure: 6.0),
  Grade(codeGrade: GradeEnum.va,  label: 'Vacataire Autre (VA)',            nbHeure: 4.5),
  Grade(codeGrade: GradeEnum.ac,  label: 'Assistant Contractuel',           nbHeure: 6.0),
  Grade(codeGrade: GradeEnum.as,  label: 'Assistant',                       nbHeure: 7.5),
  Grade(codeGrade: GradeEnum.ex,  label: 'Externe (EX)',                    nbHeure: 3.0),
  Grade(codeGrade: GradeEnum.pes, label: 'PES',                             nbHeure: 6.0),
  Grade(codeGrade: GradeEnum.mc,  label: 'Maitre de Conférences',           nbHeure: 6.0),
];



final List<Map<String, dynamic>> dummyData = List.generate(20, (index) {
  return {
    "seance": SeanceEnum.values[index % SeanceEnum.values.length],
    "date": DateTime.now().add(Duration(days: index)),
    "semestre": SeanceEnum.values[index % SeanceEnum.values.length],
    "nb Examen": 3 + (index % 5),
    "nb Surveillants": 2 + (index % 4),
  };
});

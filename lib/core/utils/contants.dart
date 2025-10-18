import 'dart:ui';

import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';

const kWindowSize = Size(1100, 700);

const kCellPadding = 8.0;

typedef ColorPair = ({Color dark, Color light});

const kgradesData = <Grade>[
  Grade(codeGrade: GradeEnum.pr, label: 'Professeur', nbOfSeance: 4),
  Grade(codeGrade: GradeEnum.mc, label: 'Maitre de Conférences', nbOfSeance: 4),
  Grade(codeGrade: GradeEnum.ma, label: 'Maitre Assistant', nbOfSeance: 7),
  Grade(codeGrade: GradeEnum.as, label: 'Assistant', nbOfSeance: 8),
  Grade(codeGrade: GradeEnum.ac, label: 'Assistant Contractuel', nbOfSeance: 9),

  Grade(codeGrade: GradeEnum.ptc, label: 'Professeur Tronc Commun', nbOfSeance: 9),
  Grade(
    codeGrade: GradeEnum.pes,
    label: 'Professeur d’enseignement secondaire',
    nbOfSeance: 9,
  ),

  Grade(codeGrade: GradeEnum.ex, label: 'Expert', nbOfSeance: 3),
  Grade(codeGrade: GradeEnum.v, label: 'Vacataire', nbOfSeance: 4),
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

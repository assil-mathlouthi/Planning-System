import 'dart:ui';

import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';

const kWindowSize = Size(1100, 700);

final List<Map<String, dynamic>> shortDummyData = [
  {
    "seance": Seance.s2,
    "date": DateTime.now().add(Duration(days: 20)).toString(),
    "semestre": Semestre.sem2,
    "nb Examen": 3,
    "nb Surveillants": 2,
  },
  {
    "seance": Seance.s2,
    "date": DateTime.now().add(Duration(days: 20)).toString(),
    "semestre": Semestre.sem2,
    "nb Examen": 3,
    "nb Surveillants": 2,
  },
  {
    "seance": Seance.s2,
    "date": DateTime.now().add(Duration(days: 20)).toString(),
    "semestre": Semestre.sem2,
    "nb Examen": 3,
    "nb Surveillants": 2,
  },
];

final List<Map<String, dynamic>> dummyData = List.generate(20, (index) {
  return {
    "seance": Seance.values[index % Seance.values.length],
    "date": DateTime.now().add(Duration(days: index)),
    "semestre": Semestre.values[index % Semestre.values.length],
    "nb Examen": 3 + (index % 5),
    "nb Surveillants": 2 + (index % 4),
  };
});

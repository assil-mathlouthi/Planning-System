import 'dart:ui';

import 'package:planning_system/core/enums/seance.dart';

const kWindowSize = Size(1100, 700);

final List<Map<String, dynamic>> dummyData = List.generate(20, (index) {
  return {
    "seance": SeanceEnum.values[index % SeanceEnum.values.length],
    "date": DateTime.now().add(Duration(days: index)),
    "semestre": SeanceEnum.values[index % SeanceEnum.values.length],
    "nb Examen": 3 + (index % 5),
    "nb Surveillants": 2 + (index % 4),
  };
});

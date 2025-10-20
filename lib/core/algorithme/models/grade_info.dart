import 'package:planning_system/core/enums/grade.dart';


class GradeInfo {
  final GradeEnum grade;
  final String libelle;
  final int nbSeancesMax;

  const GradeInfo({
    required this.grade,
    required this.libelle,
    required this.nbSeancesMax,
  });
}

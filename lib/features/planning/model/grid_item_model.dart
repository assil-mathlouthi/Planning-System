import 'package:planning_system/core/enums/semestre.dart';

class GridItemModel {
  final String codeSmartex;
  final String nom;
  final String prenom;
  final int nbrSurveillances;
  final SemestreEnum semestre;

  GridItemModel({
    required this.codeSmartex,
    required this.nom,
    required this.prenom,
    required this.nbrSurveillances,
    required this.semestre,
  });
}

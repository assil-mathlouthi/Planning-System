import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';

class VoeuxItemModel {
  Semestre semestre;
  Session session;
  String codeSmartexEns;
  int jour;
  Seance seance;
  VoeuxItemModel({
    required this.semestre,
    required this.session,
    required this.codeSmartexEns,
    required this.jour,
    required this.seance,
  });
}

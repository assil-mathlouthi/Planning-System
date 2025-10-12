import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';

class voeuxItemModel {
  Semestre semestre;
  Session session;
  String codeSmartexEns;
  int jour;
  Seance seance;
  voeuxItemModel({
    required this.semestre,
    required this.session,
    required this.codeSmartexEns,
    required this.jour,
    required this.seance,
  });
}

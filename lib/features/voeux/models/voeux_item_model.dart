import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';

class VoeuxItemModel {
  SemestreEnum semestre;
  SessionEnum session;
  String codeSmartexEns;
  int jour;
  SeanceEnum seance;
  VoeuxItemModel({
    required this.semestre,
    required this.session,
    required this.codeSmartexEns,
    required this.jour,
    required this.seance,
  });
}

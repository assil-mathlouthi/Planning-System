// Classe pour les voeux des enseignants
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';


class Voeux {
  final int id;
  final SemestreEnum semestre;
  final SessionEnum session;
  final String codeSmartexEns;
  final int jour;
  final SeanceEnum seance;

  Voeux({
    required this.id,
    required this.semestre,
    required this.session,
    required this.codeSmartexEns,
    required this.jour,
    required this.seance,
  });

  @override
  String toString() {
    return 'Voeu $id: $codeSmartexEns - J$jour-$seance ($semestre $session)';
  }
}

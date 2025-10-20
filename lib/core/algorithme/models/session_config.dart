import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';


class SessionConfig {
  final int id;
  final SemestreEnum semestre;
  final SessionEnum session;
  final int nbJours;
  final int maxCreneauxParJour;
  final double pourcentageMaxCreneaux;

  const SessionConfig({
    required this.id,
    required this.semestre,
    required this.session,
    required this.nbJours,
    required this.maxCreneauxParJour,
    required this.pourcentageMaxCreneaux,
  });

  @override
  String toString() {
    return 'Session $semestre $session: $nbJours jours, max $maxCreneauxParJour crén/j ($pourcentageMaxCreneaux%)';
  }
}

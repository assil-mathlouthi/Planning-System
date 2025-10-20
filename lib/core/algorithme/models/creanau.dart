import 'package:planning_system/core/enums/seance.dart';


class CreneauComplet {
  final int jourSession;
  final SeanceEnum seance;
  final int codeCreneau;
  final DateTime dateCreneau;

  CreneauComplet({
    required this.jourSession,
    required this.seance,
    required this.codeCreneau,
    required this.dateCreneau,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreneauComplet &&
          runtimeType == other.runtimeType &&
          jourSession == other.jourSession &&
          seance == other.seance;

  @override
  int get hashCode => jourSession.hashCode ^ seance.hashCode;

 
}

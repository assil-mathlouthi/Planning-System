import 'package:planning_system/core/enums/seance.dart';

class EnseignantPdfModel {
  final String nom;
  final String prenom;
  final DateTime date;
  final SeanceEnum seanceEnum;
  final double duree;

  EnseignantPdfModel({
    required this.nom,
    required this.prenom,
    required this.date,
    required this.seanceEnum,
    required this.duree,
  });

  @override
  String toString() {
    return 'EnseignantPdfModel(nom: '
        '$nom, prenom: $prenom, date: $date, seanceEnum: $seanceEnum, duree: $duree)';
  }
}

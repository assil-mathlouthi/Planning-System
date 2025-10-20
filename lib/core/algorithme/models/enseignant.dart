
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/utils/contants.dart';

import 'creanau.dart';
import 'matiere.dart';

class Enseignant {
  final String codeSmartexEns;
  final String nom;
  final String prenom;
  final String email;
  final GradeEnum gradeCode;
  final bool participeSurveillance;
  final List<Matiere> matieres;
  List<CreneauComplet> creneauxAffectes = [];
  Map<int, int> creneauxParJour = {}; // Suivi des créneaux par jour

  Enseignant({
    required this.codeSmartexEns,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.gradeCode,
    required this.participeSurveillance,
    required this.matieres,
  });

  int get nbSeancesMax => kgradesDataV2[gradeCode]!.nbOfSeance;
  int get nbSeancesAffectees => creneauxAffectes.length;
  double get pourcentageUtilisation =>
      (nbSeancesAffectees / nbSeancesMax * 100);

  // Respecte le nombre maximum de séances par grade
  bool get respecteContrainteSeances => nbSeancesAffectees <= nbSeancesMax;

  // Minimum 2 créneaux par professeur
  bool get respecteContrainteMinCreneaux => nbSeancesAffectees >= 2;

  // Maximum 3 créneaux par jour (avec 20% d'exception)
  bool respecteContrainteMaxCreneauxParJour(int jour) {
    return (creneauxParJour[jour] ?? 0) <= 3;
  }

  // Vérifie si l'enseignant peut avoir un 3ème créneau ce jour (20% des cas)
  bool peutAvoirTroisiemeCreneau(int jour, double pourcentageMax) {
    final creneauxCeJour = creneauxParJour[jour] ?? 0;
    return creneauxCeJour < 2 ||
        (creneauxCeJour == 2 && _estDansPourcentageMax(pourcentageMax));
  }

  bool _estDansPourcentageMax(double pourcentageMax) {
    // Simule la sélection des 20% d'enseignants qui peuvent avoir 3 créneaux
    return codeSmartexEns.hashCode % 100 < (pourcentageMax * 100);
  }

  bool peutEnseigner(Matiere matiere) => matieres.contains(matiere);

  void ajouterCreneau(CreneauComplet creneau) {
    if (!creneauxAffectes.contains(creneau)) {
      creneauxAffectes.add(creneau);

      // Mettre à jour le compteur par jour
      final jour = creneau.jourSession;
      creneauxParJour[jour] = (creneauxParJour[jour] ?? 0) + 1;
    }
  }

  void retirerCreneau(CreneauComplet creneau) {
    if (creneauxAffectes.remove(creneau)) {
      final jour = creneau.jourSession;
      creneauxParJour[jour] = (creneauxParJour[jour] ?? 1) - 1;
    }
  }

  int getCreneauxCeJour(int jour) {
    return creneauxParJour[jour] ?? 0;
  }

  @override
  String toString() {
    return '$nom $prenom ($gradeCode) - $nbSeancesAffectees séances/${nbSeancesMax} max';
  }

  String toDetailedString() {
    final matieresStr = matieres.map((m) => m.libelle).join(', ');
    final creneauxStr = creneauxAffectes.map((c) => c.toString()).join(', ');
    final parJourStr = creneauxParJour.entries
        .map((e) => 'J${e.key}:${e.value}')
        .join(', ');

    return '$nom $prenom ($gradeCode)\n  Matières: $matieresStr\n  Créneaux: $creneauxStr\n  Par jour: $parJourStr\n  Total: $nbSeancesAffectees/$nbSeancesMax (${pourcentageUtilisation.toStringAsFixed(1)}%)';
  }
}

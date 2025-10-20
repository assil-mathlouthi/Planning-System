import 'dart:math';
import 'package:planning_system/core/algorithme/models/creneau_capacite.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';

import 'models/creanau.dart';
import 'models/enseignant.dart';
import 'models/matiere.dart';
import 'models/session_config.dart';
import 'models/voeux.dart';

class AlgorithmeAffectation {
  // CONSTANTES
  final int minCreneauxParJour = 2;
  final int maxCreneauxParJour;
  final int joursParSession;
  final int seancesParJour = 4;

  // DISTRIBUTION 70%/30%
  static const double pourcentage2CreneauxParJour = 0.7;
  static const double pourcentage3CreneauxParJour = 0.3;

  // TOLÉRANCES
  static const int maxIterations = 50;
  static const int toleranceDistribution = 2;
  static const double toleranceCapacite = 1.10;

  // DONNÉES
  final Map<String, Enseignant> enseignants;
  final Map<CreneauComplet, CreneauCapacity> capaciteParCreneau;
  final Map<CreneauComplet, List<Matiere>> matieresParCreneau;
  final Map<String, List<Voeux>> voeuxParEnseignant;
  final SessionConfig config;

  // STRUCTURES
  final Map<CreneauComplet, List<Enseignant>> affectations = {};
  final Map<CreneauComplet, Set<Matiere>> matieresCouvertes = {};
  final Map<CreneauComplet, Set<Matiere>> matieresSpecialistesCouvertes = {};
  final Map<int, int> enseignantsAvec2Creneaux = {};
  final Map<int, int> enseignantsAvec3Creneaux = {};
  final Map<int, int> totalEnseignantsParJour = {};

  // SUIVI DES CONTRAINTES
  final Map<Enseignant, List<int>> _consecutifsParJour = {};
  final Map<Enseignant, int> _blocsConsecutifs = {};
  final Map<Enseignant, int> _voeuxRespectes = {};
  final Map<CreneauComplet, List<String>> examensParCreneau;

  AlgorithmeAffectation({
    required this.enseignants,
    required this.capaciteParCreneau,
    required this.matieresParCreneau,
    required this.voeuxParEnseignant,
    required this.config,
    required this.examensParCreneau,
  }) : maxCreneauxParJour = config.maxCreneauxParJour,
       joursParSession = config.nbJours {
    _initialiserStructures();
  }

  void _initialiserStructures() {
    for (var creneau in capaciteParCreneau.keys) {
      affectations[creneau] = [];
      matieresCouvertes[creneau] = {};
      matieresSpecialistesCouvertes[creneau] = {};
    }

    for (int jour = 1; jour <= joursParSession; jour++) {
      enseignantsAvec2Creneaux[jour] = 0;
      enseignantsAvec3Creneaux[jour] = 0;
      totalEnseignantsParJour[jour] = 0;
    }

    for (var enseignant in enseignants.values) {
      _consecutifsParJour[enseignant] = List.filled(joursParSession + 1, 0);
      _blocsConsecutifs[enseignant] = 0;
      _voeuxRespectes[enseignant] = 0;
    }
  }

  // ========== ALGORITHME PRINCIPAL ==========
  Map<String, dynamic> executer() {
    try {
      _validerDonneesEntree();
      _phase0AffectationExamensRequises();
      _phase1AffectationSpecialistes();
      _phase2GarantirMinimumParJour();
      _phase3RemplissageCapaciteSimple();
      _phase4CorrectionConsecutifsAgressive();
      _phase5CorrectionDistribution();
      _phase6ValidationFinale();
      _phase7OptimisationVoeux();
      _phase8AffectationFinaleAggressive();
      _phase9MaximisationCapacite();
      _garantirMinimumPourTous();
      _validationFinaleRenforcee();
      // VALIDATION FINALE RENFORCÉE
      _validationFinaleRenforcee();

      final resultats = _genererResultatsComplets();
      return resultats;
    } catch (e) {
      return _genererResultatsAvecErreur(e);
    }
  }

  void _phase0AffectationExamensRequises() {
    for (var creneau in examensParCreneau.keys) {
      final codesSmartexRequises = examensParCreneau[creneau]!;

      for (var codeSmartex in codesSmartexRequises) {
        final enseignant = enseignants[codeSmartex];
        if (enseignant != null) {
          if (_peutEtreAffecteStrict(enseignant, creneau)) {
            _affecterCreneau(enseignant, creneau);
          }
        }
      }
    }
  }

  // ========== PHASE 1: AFFECTATION DES SPÉCIALISTES ==========
  void _phase1AffectationSpecialistes() {
    for (var creneau in capaciteParCreneau.keys) {
      final matieresCreneau = matieresParCreneau[creneau]!;

      for (var matiere in matieresCreneau) {
        if (!matieresSpecialistesCouvertes[creneau]!.contains(matiere)) {
          final specialiste = _trouverSpecialisteOptimal(matiere, creneau);
          if (specialiste != null) {
            _affecterCreneau(specialiste, creneau);
            matieresSpecialistesCouvertes[creneau]!.add(matiere);
          }
        }
      }
    }
  }

  Enseignant? _trouverSpecialisteOptimal(
    Matiere matiere,
    CreneauComplet creneau,
  ) {
    Enseignant? meilleurSpecialiste;
    int meilleurScore = -1;

    for (var enseignant in enseignants.values) {
      if (!estSpecialiste(enseignant, matiere)) continue;
      if (!_peutEtreAffecteStrict(enseignant, creneau)) continue;

      final score = _calculerScoreSpecialiste(enseignant, creneau, matiere);
      if (score > meilleurScore) {
        meilleurScore = score;
        meilleurSpecialiste = enseignant;
      }
    }

    return meilleurSpecialiste;
  }

  bool estSpecialiste(Enseignant enseignant, Matiere matiere) {
    final gradesSpecialistes = [
      GradeEnum.pr,
      GradeEnum.ma,
      GradeEnum.ptc,
      GradeEnum.mc,
    ];
    return gradesSpecialistes.contains(enseignant.gradeCode) &&
        enseignant.matieres.contains(matiere);
  }

  int _calculerScoreSpecialiste(
    Enseignant enseignant,
    CreneauComplet creneau,
    Matiere matiere,
  ) {
    int score = 0;

    // CRITÈRE 1: BESOIN DE L'ENSEIGNANT (40 points)
    final besoinEnseignant =
        (minCreneauxParJour * joursParSession) - enseignant.nbSeancesAffectees;
    score += min(besoinEnseignant * 10, 40);

    // CRITÈRE 2: COMPÉTENCE (30 points)
    score += _calculerNiveauSpecialisation(enseignant, matiere) * 6;

    // CRITÈRE 3: ÉQUILIBRE DISTRIBUTION (20 points)
    final creneauxCeJour = enseignant.getCreneauxCeJour(creneau.jourSession);
    final statsJour = _getStatsDistributionJour(creneau.jourSession);

    if (creneauxCeJour == 0) {
      score += 10;
    } else if (creneauxCeJour == 1 && statsJour['manque_2']! > 0)
      score += 15;
    else if (creneauxCeJour == 2 && statsJour['manque_3']! > 0)
      score += 10;

    // CRITÈRE 4: CONSÉCUTIFS (10 points)
    score += _calculerBonusConsecutif(enseignant, creneau);

    // CRITÈRE 5: VOEUX (25 points)
    score += _calculerBonusVoeux(enseignant, creneau);

    return score;
  }

  int _calculerNiveauSpecialisation(Enseignant enseignant, Matiere matiere) {
    final scoreGrade =
        {
          GradeEnum.pr: 5,
          GradeEnum.ma: 4,
          GradeEnum.ptc: 3,
          GradeEnum.mc: 2,
          GradeEnum.ex: 1,
          GradeEnum.ac: 1,
          GradeEnum.as: 1,
          GradeEnum.v: 0,
        }[enseignant.gradeCode] ??
        0;

    final estMatierePrincipale = enseignant.matieres.indexOf(matiere) == 0;
    return scoreGrade + (estMatierePrincipale ? 2 : 0);
  }

  // ========== PHASE 2: GARANTIR MINIMUM PAR JOUR ==========
  void _phase2GarantirMinimumParJour() {
    int iterations = 0;
    bool changement = true;

    while (changement && iterations < 200) {
      changement = false;
      iterations++;

      // Priorité ABSOLUE aux enseignants avec jours incomplets
      final enseignantsPrioritaires =
          _getEnseignantsAvecJoursIncompletsAgressif();

      for (var enseignant in enseignantsPrioritaires) {
        for (int jour = 1; jour <= joursParSession; jour++) {
          final creneauxCeJour = enseignant.getCreneauxCeJour(jour);

          // CORRECTION: Si l'enseignant a AU MOINS 1 créneau ce jour, il doit en avoir au moins 2
          if (creneauxCeJour > 0 && creneauxCeJour < minCreneauxParJour) {
            final manquant = minCreneauxParJour - creneauxCeJour;
            final affectes = _affecterCreneauxJourAgressif(
              enseignant,
              jour,
              manquant,
            );
            if (affectes > 0) {
              changement = true;
            } else {
              // SI IMPOSSIBLE D'AJOUTER, RETIRER LE CRÉNEAU UNIQUE
              _retirerCreneauxDuJour(enseignant, jour);
              changement = true;
            }
          }
        }
      }

      final joursIncomplets = _compterJoursIncomplets();

      if (joursIncomplets == 0) break;
    }
  }

  void _phase3RemplissageCapaciteSimple() {
    // Parcourir tous les créneaux sous-remplis
    for (var creneau in capaciteParCreneau.keys) {
      final capacite = capaciteParCreneau[creneau]!.nbProfesseursRequis;
      final actuels = affectations[creneau]!.length;

      if (actuels < capacite) {
        final manquant = capacite - actuels;
        _remplirCapaciteSimple(creneau, manquant);
      }
    }
  }

  int _remplirCapaciteSimple(CreneauComplet creneau, int manquant) {
    int ajoutes = 0;

    // Trouver TOUS les profs disponibles qui peuvent enseigner AU MOINS une matière du créneau
    final candidats = enseignants.values
        .where((enseignant) => _peutEtreAffecteStrict(enseignant, creneau))
        .where(
          (enseignant) => _peutEnseignerAuMoinsUneMatiere(enseignant, creneau),
        )
        .where((enseignant) => !affectations[creneau]!.contains(enseignant))
        .toList();

    // Trier par COMPÉTENCE (nombre de matières qu'ils peuvent enseigner)
    candidats.sort((a, b) {
      final scoreA = _compterMatieresEnseignables(a, creneau);
      final scoreB = _compterMatieresEnseignables(b, creneau);
      return scoreB.compareTo(scoreA);
    });

    // Affecter jusqu'à combler le manquant
    for (var candidat in candidats) {
      if (ajoutes >= manquant) break;

      _affecterCreneau(candidat, creneau);
      ajoutes++;
    }

    return ajoutes;
  }

  bool _peutEnseignerAuMoinsUneMatiere(
    Enseignant enseignant,
    CreneauComplet creneau,
  ) {
    final matieresCreneau = matieresParCreneau[creneau]!;
    return matieresCreneau.any((matiere) => enseignant.peutEnseigner(matiere));
  }

  int _compterMatieresEnseignables(
    Enseignant enseignant,
    CreneauComplet creneau,
  ) {
    final matieresCreneau = matieresParCreneau[creneau]!;
    return matieresCreneau
        .where((matiere) => enseignant.peutEnseigner(matiere))
        .length;
  }

  List<Enseignant> _getEnseignantsAvecJoursIncompletsAgressif() {
    return enseignants.values.where((enseignant) {
      for (int jour = 1; jour <= joursParSession; jour++) {
        final creneauxCeJour = enseignant.getCreneauxCeJour(jour);
        if (creneauxCeJour > 0 && creneauxCeJour < minCreneauxParJour) {
          return true;
        }
      }
      return false;
    }).toList()..sort((a, b) {
      // Priorité aux pires cas: enseignants avec le plus de jours incomplets
      final problemesA = _compterJoursIncompletsEnseignant();
      final problemesB = _compterJoursIncompletsEnseignant();
      if (problemesA != problemesB) return problemesB.compareTo(problemesA);

      // Ensuite par besoin global
      final besoinA =
          (minCreneauxParJour * joursParSession) - a.nbSeancesAffectees;
      final besoinB =
          (minCreneauxParJour * joursParSession) - b.nbSeancesAffectees;
      return besoinB.compareTo(besoinA);
    });
  }

  int _affecterCreneauxJourAgressif(
    Enseignant enseignant,
    int jour,
    int manquant,
  ) {
    int affectes = 0;

    for (int i = 0; i < manquant; i++) {
      // Recherche PLUS LARGE des créneaux éligibles
      final creneauOptimal = _trouverCreneauOptimalPourJourLarge(
        enseignant,
        jour,
      );
      if (creneauOptimal != null) {
        _affecterCreneau(enseignant, creneauOptimal);
        affectes++;
      } else {
        break;
      }
    }

    return affectes;
  }

  CreneauComplet? _trouverCreneauOptimalPourJourLarge(
    Enseignant enseignant,
    int jour,
  ) {
    // Recherche ÉLARGIE: autorise plus de flexibilité sur les contraintes
    final creneauxEligibles = capaciteParCreneau.keys
        .where((creneau) => creneau.jourSession == jour)
        .where((creneau) => _peutEtreAffecteAvecTolerance(enseignant, creneau))
        .toList();

    if (creneauxEligibles.isEmpty) return null;

    // Priorité aux créneaux avec le plus grand besoin
    creneauxEligibles.sort((a, b) {
      final besoinA =
          capaciteParCreneau[a]!.nbProfesseursRequis - affectations[a]!.length;
      final besoinB =
          capaciteParCreneau[b]!.nbProfesseursRequis - affectations[b]!.length;
      if (besoinA != besoinB) return besoinB.compareTo(besoinA);

      return _calculerScoreCreneauComplet(
        enseignant,
        b,
      ).compareTo(_calculerScoreCreneauComplet(enseignant, a));
    });

    return creneauxEligibles.isNotEmpty ? creneauxEligibles.first : null;
  }

  int _compterJoursIncomplets() {
    int total = 0;
    for (var enseignant in enseignants.values) {
      for (int jour = 1; jour <= joursParSession; jour++) {
        final creneauxCeJour = enseignant.getCreneauxCeJour(jour);
        if (creneauxCeJour > 0 && creneauxCeJour < minCreneauxParJour) {
          total++;
        }
      }
    }
    return total;
  }

  int _compterJoursIncompletsEnseignant() {
    return enseignants.values.where((enseignant) {
      for (int jour = 1; jour <= joursParSession; jour++) {
        final creneauxCeJour = enseignant.getCreneauxCeJour(jour);
        if (creneauxCeJour > 0 && creneauxCeJour < minCreneauxParJour) {
          return true;
        }
      }
      return false;
    }).length;
  }

  int _affecterCreneauxJour(Enseignant enseignant, int jour, int manquant) {
    int affectes = 0;

    for (int i = 0; i < manquant; i++) {
      final creneauOptimal = _trouverCreneauOptimalPourJour(enseignant, jour);
      if (creneauOptimal != null) {
        _affecterCreneau(enseignant, creneauOptimal);
        affectes++;
      } else {
        break;
      }
    }

    return affectes;
  }

  CreneauComplet? _trouverCreneauOptimalPourJour(
    Enseignant enseignant,
    int jour,
  ) {
    final creneauxEligibles = capaciteParCreneau.keys
        .where((creneau) => creneau.jourSession == jour)
        .where((creneau) => _peutEtreAffecteStrict(enseignant, creneau))
        .toList();

    if (creneauxEligibles.isEmpty) return null;

    creneauxEligibles.sort((a, b) {
      return _calculerScoreCreneauComplet(
        enseignant,
        b,
      ).compareTo(_calculerScoreCreneauComplet(enseignant, a));
    });

    return creneauxEligibles.isNotEmpty ? creneauxEligibles.first : null;
  }

  // ========== PHASE 3: AFFECTATION PRIORITÉ BESOIN ==========
  void _phase3AffectationPrioriteBesoin() {
    int iterations = 0;
    bool changement = true;

    while (changement && iterations < 100) {
      changement = false;
      iterations++;

      final enseignantsParBesoin = _getEnseignantsParPrioriteBesoin();

      for (var enseignant in enseignantsParBesoin) {
        // Vérifier d'abord les jours incomplets
        bool aJoursIncomplets = false;
        for (int jour = 1; jour <= joursParSession; jour++) {
          final creneauxCeJour = enseignant.getCreneauxCeJour(jour);
          if (creneauxCeJour > 0 && creneauxCeJour < minCreneauxParJour) {
            aJoursIncomplets = true;
            final manquant = minCreneauxParJour - creneauxCeJour;
            if (_affecterCreneauxJour(enseignant, jour, manquant) > 0) {
              changement = true;
            }
          }
        }

        // Ensuite le besoin global
        if (!aJoursIncomplets &&
            enseignant.nbSeancesAffectees <
                minCreneauxParJour * joursParSession) {
          final manquantGlobal =
              (minCreneauxParJour * joursParSession) -
              enseignant.nbSeancesAffectees;
          if (_affecterSelonBesoinEtCompetence(enseignant, manquantGlobal) >
              0) {
            changement = true;
          }
        }
      }

      final sousAffectes = enseignants.values.where((e) {
        for (int jour = 1; jour <= joursParSession; jour++) {
          if (e.getCreneauxCeJour(jour) > 0 &&
              e.getCreneauxCeJour(jour) < minCreneauxParJour) {
            return true;
          }
        }
        return e.nbSeancesAffectees < minCreneauxParJour * joursParSession;
      }).length;

      if (sousAffectes == 0) break;
    }
  }

  List<Enseignant> _getEnseignantsParPrioriteBesoin() {
    return enseignants.values.toList()..sort((a, b) {
      // PRIORITÉ 1: Taux de remplissage le PLUS FAIBLE d'abord
      final tauxRemplissageA = a.nbSeancesAffectees / a.nbSeancesMax;
      final tauxRemplissageB = b.nbSeancesAffectees / b.nbSeancesMax;
      if (tauxRemplissageA.compareTo(tauxRemplissageB) != 0) {
        return tauxRemplissageA.compareTo(tauxRemplissageB);
      }

      // PRIORITÉ 2: Enseignants avec capacité MAXIMALE non utilisée
      final capaciteRestanteA = a.nbSeancesMax - a.nbSeancesAffectees;
      final capaciteRestanteB = b.nbSeancesMax - b.nbSeancesAffectees;
      if (capaciteRestanteA != capaciteRestanteB) {
        return capaciteRestanteB.compareTo(capaciteRestanteA);
      }

      // PRIORITÉ 3: Jours incomplets (contrainte stricte)
      final problemesA = _compterJoursIncompletsPourEnseignant(a);
      final problemesB = _compterJoursIncompletsPourEnseignant(b);
      return problemesB.compareTo(problemesA);
    });
  }

  // Nouvelle méthode pour compter les jours incomplets par enseignant
  int _compterJoursIncompletsPourEnseignant(Enseignant enseignant) {
    int problemes = 0;
    for (int jour = 1; jour <= joursParSession; jour++) {
      final creneauxCeJour = enseignant.getCreneauxCeJour(jour);
      if (creneauxCeJour > 0 && creneauxCeJour < minCreneauxParJour) {
        problemes++;
      }
    }
    return problemes;
  }

  int _affecterSelonBesoinEtCompetence(Enseignant enseignant, int manquant) {
    int affectes = 0;

    for (int i = 0; i < manquant; i++) {
      final creneauOptimal = _trouverCreneauOptimalPourEnseignant(enseignant);
      if (creneauOptimal != null) {
        _affecterCreneau(enseignant, creneauOptimal);
        affectes++;
      } else {
        break;
      }
    }

    return affectes;
  }

  CreneauComplet? _trouverCreneauOptimalPourEnseignant(Enseignant enseignant) {
    final creneauxEligibles = capaciteParCreneau.keys
        .where((creneau) => _peutEtreAffecteStrict(enseignant, creneau))
        .toList();

    if (creneauxEligibles.isEmpty) return null;

    creneauxEligibles.sort((a, b) {
      return _calculerScoreCreneauComplet(
        enseignant,
        b,
      ).compareTo(_calculerScoreCreneauComplet(enseignant, a));
    });

    return creneauxEligibles.isNotEmpty ? creneauxEligibles.first : null;
  }

  int _calculerScoreCreneauComplet(
    Enseignant enseignant,
    CreneauComplet creneau,
  ) {
    int score = 0;

    // CRITÈRE 1: BESOIN DU CRÉNEAU (30 points) - inchangé
    final capacite = capaciteParCreneau[creneau]!.nbProfesseursRequis;
    final actuels = affectations[creneau]!.length;
    final besoinCreneau = capacite - actuels;
    score += besoinCreneau * 6;

    // CRITÈRE 2: COMPÉTENCE MATIÈRE (25 points) - inchangé
    final matieresCreneau = matieresParCreneau[creneau]!;
    bool peutEnseigner = false;
    for (var matiere in matieresCreneau) {
      if (enseignant.peutEnseigner(matiere)) {
        peutEnseigner = true;
        if (!matieresCouvertes[creneau]!.contains(matiere)) {
          score += 20;
        } else {
          score += 5;
        }
        break;
      }
    }
    if (!peutEnseigner) return 0;

    // CRITÈRE 3: BESOIN RELATIF ENSEIGNANT (20 points) - CORRIGÉ
    final tauxRemplissage =
        enseignant.nbSeancesAffectees / enseignant.nbSeancesMax;
    final besoinRelatif = (1.0 - tauxRemplissage) * 20; // 0-20 points
    score += besoinRelatif.round();

    // CRITÈRE 4: CAPACITÉ INEXPLOITÉE (10 points) - NOUVEAU
    final capaciteInutilisee =
        enseignant.nbSeancesMax - enseignant.nbSeancesAffectees;
    score += min(
      capaciteInutilisee * 2,
      10,
    ); // Bonus pour grande capacité disponible

    // CRITÈRE 5: CONSÉCUTIFS (10 points) - inchangé
    score += _calculerBonusConsecutif(enseignant, creneau);

    // CRITÈRE 6: DISTRIBUTION (10 points) - inchangé
    final creneauxCeJour = enseignant.getCreneauxCeJour(creneau.jourSession);
    final statsJour = _getStatsDistributionJour(creneau.jourSession);
    if (creneauxCeJour == 0)
      score += 5;
    else if (creneauxCeJour == 1 && statsJour['manque_2']! > 0)
      score += 8;
    else if (creneauxCeJour == 2 && statsJour['manque_3']! > 0)
      score += 5;

    // CRITÈRE 7: VOEUX (25 points) - inchangé
    score += _calculerBonusVoeux(enseignant, creneau);

    return score;
  }

  // ========== PHASE 4: OPTIMISATION DES CONSÉCUTIFS ==========
  void _phase4CorrectionConsecutifsAgressive() {
    int corrections = 0;

    for (int iteration = 1; iteration <= 50; iteration++) {
      int correctionsIteration = 0;

      for (var enseignant in enseignants.values) {
        for (int jour = 1; jour <= joursParSession; jour++) {
          final creneauxDuJour = enseignant.creneauxAffectes
              .where((c) => c.jourSession == jour)
              .toList();

          if (creneauxDuJour.length >= 2 &&
              !_sontCreneauxConsecutifs(creneauxDuJour)) {
            if (_corrigerConsecutifsAgressif(
              enseignant,
              jour,
              creneauxDuJour,
            )) {
              correctionsIteration++;
              corrections++;
            }
          }
        }
      }
      int correctionsOptimisation = _optimiserBlocsConsecutifs();
      corrections += correctionsOptimisation;

      if (correctionsIteration == 0 && correctionsOptimisation == 0) break;
    }
  }

  bool _corrigerConsecutifsAgressif(
    Enseignant enseignant,
    int jour,
    List<CreneauComplet> creneauxDuJour,
  ) {
    final seancesActuelles = creneauxDuJour.map((c) => c.seance).toSet();

    // Essayer différents blocs consécutifs possibles
    final blocsConsecutifs = _getBlocsConsecutifsPourNombre(
      creneauxDuJour.length,
    );

    for (var bloc in blocsConsecutifs) {
      if (_peutAffecterBlocConsecutif(
        enseignant,
        jour,
        bloc,
        seancesActuelles,
      )) {
        // RETIRER les anciens créneaux
        for (var creneau in creneauxDuJour) {
          _retirerCreneau(enseignant, creneau);
        }

        // AJOUTER les nouveaux créneaux consécutifs
        for (var seance in bloc) {
          final nouveauCreneau = _trouverCreneauParJourSeance(jour, seance);
          if (nouveauCreneau != null &&
              _peutEtreAffecteAvecTolerance(enseignant, nouveauCreneau)) {
            _affecterCreneau(enseignant, nouveauCreneau);
          }
        }

        return true;
      }
    }

    return false;
  }

  List<List<SeanceEnum>> _getBlocsConsecutifsPourNombre(int nombre) {
    final blocs = <List<SeanceEnum>>[];

    if (nombre == 2) {
      // Blocs de 2 consécutifs
      blocs.add([SeanceEnum.s1, SeanceEnum.s2]);
      blocs.add([SeanceEnum.s2, SeanceEnum.s3]);
      blocs.add([SeanceEnum.s3, SeanceEnum.s4]);
    } else if (nombre == 3) {
      // Blocs de 3 consécutifs
      blocs.add([SeanceEnum.s1, SeanceEnum.s2, SeanceEnum.s3]);
      blocs.add([SeanceEnum.s2, SeanceEnum.s3, SeanceEnum.s4]);
    }

    return blocs;
  }

  bool _peutAffecterBlocConsecutif(
    Enseignant enseignant,
    int jour,
    List<SeanceEnum> bloc,
    Set<SeanceEnum> seancesActuelles,
  ) {
    // Vérifier si l'enseignant peut être affecté à tous les créneaux du bloc
    for (var seance in bloc) {
      final creneau = _trouverCreneauParJourSeance(jour, seance);
      if (creneau == null ||
          !_peutEtreAffecteAvecTolerance(enseignant, creneau)) {
        return false;
      }
    }
    return true;
  }

  CreneauComplet? _trouverCreneauParJourSeance(int jour, SeanceEnum seance) {
    for (var creneau in capaciteParCreneau.keys) {
      if (creneau.jourSession == jour && creneau.seance == seance) {
        return creneau;
      }
    }
    return null;
  }

  int _optimiserConsecutionJour(
    Enseignant enseignant,
    int jour,
    List<CreneauComplet> creneauxDuJour,
  ) {
    int ameliorations = 0;

    creneauxDuJour.sort((a, b) => a.seance.index.compareTo(b.seance.index));

    for (var creneau in creneauxDuJour) {
      final meilleurCreneau = _trouverCreneauPourConsecutif(
        enseignant,
        jour,
        creneauxDuJour,
        creneau,
      );
      if (meilleurCreneau != null && meilleurCreneau != creneau) {
        _retirerCreneau(enseignant, creneau);
        _affecterCreneau(enseignant, meilleurCreneau);
        ameliorations++;
        break;
      }
    }

    return ameliorations;
  }

  int _compterConsecutifs(List<CreneauComplet> creneaux) {
    if (creneaux.length < 2) return 0;

    int consecutifs = 0;
    creneaux.sort((a, b) => a.seance.index.compareTo(b.seance.index));

    for (int i = 0; i < creneaux.length - 1; i++) {
      if (creneaux[i + 1].seance.index - creneaux[i].seance.index == 1) {
        consecutifs++;
      }
    }

    return consecutifs;
  }

  CreneauComplet? _trouverCreneauPourConsecutif(
    Enseignant enseignant,
    int jour,
    List<CreneauComplet> creneauxExistants,
    CreneauComplet creneauActuel,
  ) {
    CreneauComplet? meilleurCreneau;
    int meilleurScore = -1;

    final seancesExistantes = creneauxExistants
        .map((c) => c.seance.index)
        .toSet();
    seancesExistantes.remove(creneauActuel.seance.index);

    for (var nouveauCreneau in capaciteParCreneau.keys) {
      if (nouveauCreneau.jourSession != jour) continue;
      if (!_peutEtreAffecteStrict(enseignant, nouveauCreneau)) continue;
      if (creneauxExistants.contains(nouveauCreneau)) continue;

      final nouvellesSeances = {
        ...seancesExistantes,
        nouveauCreneau.seance.index,
      };
      final seancesEnums = nouvellesSeances
          .map((i) => SeanceEnum.values[i])
          .toSet();
      final scoreConsecutif = _calculerScoreConsecutifAmeliore(seancesEnums);

      if (scoreConsecutif > meilleurScore) {
        meilleurScore = scoreConsecutif;
        meilleurCreneau = nouveauCreneau;
      }
    }

    return meilleurCreneau;
  }

  List<List<SeanceEnum>> _getBlocsConsecutifsPossibles() {
    return [
      [SeanceEnum.s1, SeanceEnum.s2],
      [SeanceEnum.s2, SeanceEnum.s3],
      [SeanceEnum.s3, SeanceEnum.s4],
      [SeanceEnum.s1, SeanceEnum.s2, SeanceEnum.s3],
      [SeanceEnum.s2, SeanceEnum.s3, SeanceEnum.s4],
    ];
  }

  int _calculerScoreConsecutifAmeliore(Set<SeanceEnum> seances) {
    if (seances.length < 2) return 0;

    final seancesTriees = seances.toList()
      ..sort((a, b) => a.index.compareTo(b.index));
    int scoreTotal = 0;
    final blocsPossibles = _getBlocsConsecutifsPossibles();

    for (var bloc in blocsPossibles) {
      if (bloc.every((seance) => seancesTriees.contains(seance))) {
        scoreTotal += bloc.length * bloc.length * 5;
      }
    }

    for (int i = 0; i < seancesTriees.length - 1; i++) {
      if (seancesTriees[i + 1].index - seancesTriees[i].index == 1) {
        scoreTotal += 10;
      }
    }

    return scoreTotal;
  }

  int _optimiserBlocsConsecutifs() {
    int corrections = 0;

    for (var enseignant in enseignants.values) {
      for (int jour = 1; jour <= joursParSession; jour++) {
        final creneauxJour = enseignant.creneauxAffectes
            .where((c) => c.jourSession == jour)
            .toList();

        if (creneauxJour.length >= 2) {
          final scoreAvant = _calculerScoreConsecutifAmeliore(
            creneauxJour.map((c) => c.seance).toSet(),
          );

          for (var creneau in creneauxJour) {
            final meilleurCreneau = _trouverCreneauPourConsecutif(
              enseignant,
              jour,
              creneauxJour,
              creneau,
            );
            if (meilleurCreneau != null) {
              final nouvellesSeances = {
                ...creneauxJour
                    .map((c) => c.seance)
                    .where((s) => s != creneau.seance),
                meilleurCreneau.seance,
              };
              final scoreApres = _calculerScoreConsecutifAmeliore(
                nouvellesSeances,
              );

              if (scoreApres > scoreAvant) {
                _retirerCreneau(enseignant, creneau);
                _affecterCreneau(enseignant, meilleurCreneau);
                corrections++;
                break;
              }
            }
          }
        }
      }
    }

    return corrections;
  }

  int _calculerBonusConsecutif(
    Enseignant enseignant,
    CreneauComplet nouveauCreneau,
  ) {
    final creneauxJour = enseignant.creneauxAffectes
        .where((c) => c.jourSession == nouveauCreneau.jourSession)
        .map((c) => c.seance)
        .toSet();

    if (creneauxJour.isEmpty) return 0;

    final seancesAvecNouveau = {...creneauxJour, nouveauCreneau.seance};
    return _calculerScoreConsecutifAmeliore(seancesAvecNouveau) -
        _calculerScoreConsecutifAmeliore(creneauxJour);
  }

  // ========== PHASE 5: CORRECTION DISTRIBUTION ==========
  void _phase5CorrectionDistribution() {
    for (int iteration = 1; iteration <= 30; iteration++) {
      int corrections = 0;

      for (int jour = 1; jour <= joursParSession; jour++) {
        corrections += _corrigerDistributionJour(jour);
      }

      if (corrections == 0) break;

      if (_distributionGlobalementRespectee()) {
        break;
      }
    }
  }

  int _corrigerDistributionJour(int jour) {
    final stats = _getStatsDistributionJour(jour);
    int corrections = 0;

    if (stats['exces_3']! > 0) {
      corrections += _reduire3Creneaux(jour, stats['exces_3']!);
    }

    if (stats['manque_3']! > 0) {
      corrections += _augmenter3Creneaux(jour, stats['manque_3']!);
    }

    if (stats['exces_2']! > 0) {
      corrections += _ajuster2Creneaux(jour, stats['exces_2']!);
    }

    return corrections;
  }

  int _reduire3Creneaux(int jour, int excess) {
    int reductions = 0;

    final candidats =
        enseignants.values
            .where((e) => e.getCreneauxCeJour(jour) == 3)
            .where((e) => e.nbSeancesAffectees > minCreneauxParJour)
            .toList()
          ..sort(
            (a, b) => _calculerScoreSpecialisationGlobale(
              a,
            ).compareTo(_calculerScoreSpecialisationGlobale(b)),
          );

    for (var candidat in candidats) {
      if (reductions >= excess) break;

      final creneauxJour = candidat.creneauxAffectes
          .where((c) => c.jourSession == jour)
          .toList();
      final creneauARetirer = _trouverCreneauMoinsUtile(candidat, creneauxJour);

      if (creneauARetirer != null) {
        _retirerCreneau(candidat, creneauARetirer);
        reductions++;

        if (candidat.nbSeancesAffectees <
            minCreneauxParJour * joursParSession) {
          _affecterSelonBesoinEtCompetence(candidat, 1);
        }
      }
    }

    return reductions;
  }

  int _augmenter3Creneaux(int jour, int manquant) {
    int augmentations = 0;

    final candidats =
        enseignants.values
            .where((e) => e.getCreneauxCeJour(jour) == 2)
            .where((e) => e.nbSeancesAffectees < e.nbSeancesMax)
            .toList()
          ..sort((a, b) {
            final capaciteA = a.nbSeancesMax - a.nbSeancesAffectees;
            final capaciteB = b.nbSeancesMax - b.nbSeancesAffectees;
            return capaciteB.compareTo(capaciteA);
          });

    for (var candidat in candidats) {
      if (augmentations >= manquant) break;

      if (_ajouterCreneauOptimalJour(candidat, jour)) {
        augmentations++;
      }
    }

    return augmentations;
  }

  int _ajuster2Creneaux(int jour, int excess) {
    int ajustements = 0;

    final candidats =
        enseignants.values
            .where((e) => e.getCreneauxCeJour(jour) == 2)
            .where(
              (e) =>
                  e.nbSeancesAffectees > minCreneauxParJour * joursParSession,
            )
            .toList()
          ..sort(
            (a, b) => _calculerScoreSpecialisationGlobale(
              a,
            ).compareTo(_calculerScoreSpecialisationGlobale(b)),
          );

    for (var candidat in candidats) {
      if (ajustements >= excess) break;

      final creneauxJour = candidat.creneauxAffectes
          .where((c) => c.jourSession == jour)
          .toList();
      if (creneauxJour.length == 2) {
        final creneauARetirer = _trouverCreneauMoinsUtile(
          candidat,
          creneauxJour,
        );
        if (creneauARetirer != null) {
          _retirerCreneau(candidat, creneauARetirer);
          ajustements++;
        }
      }
    }

    return ajustements;
  }

  // ========== PHASE 6: VALIDATION FINALE ==========
  void _phase6ValidationFinale() {
    _verifierEtCorrigerContraintesQuotidiennes();
    _verifierEtCorrigerSpecialistes();
    _comblerCreneauxManquants();
    _corrigerCreneauxUniques();
    _optimiserCouvertureMatieres();
  }

  void _verifierEtCorrigerContraintesQuotidiennes() {
    int corrections = 0;

    for (var enseignant in enseignants.values) {
      for (int jour = 1; jour <= joursParSession; jour++) {
        final creneauxCeJour = enseignant.getCreneauxCeJour(jour);

        if (creneauxCeJour == 1) {
          if (_ajouterCreneauOptimalJour(enseignant, jour)) {
            corrections++;
          } else {
            _retirerCreneauxDuJour(enseignant, jour);
            corrections++;
          }
        } else if (creneauxCeJour >= 2) {
          final creneauxDuJour = enseignant.creneauxAffectes
              .where((c) => c.jourSession == jour)
              .toList();
          if (!_sontCreneauxConsecutifs(creneauxDuJour)) {
            final ameliorations = _optimiserConsecutionJour(
              enseignant,
              jour,
              creneauxDuJour,
            );
            corrections += ameliorations;
          }
        }
      }
    }
  }

  bool _sontCreneauxConsecutifs(List<CreneauComplet> creneaux) {
    if (creneaux.length < 2) return true;

    final seances = creneaux.map((c) => c.seance.index).toList()..sort();

    for (int i = 0; i < seances.length - 1; i++) {
      if (seances[i + 1] - seances[i] != 1) {
        return false;
      }
    }
    return true;
  }

  void _verifierEtCorrigerSpecialistes() {
    int corrections = 0;

    for (var creneau in capaciteParCreneau.keys) {
      final matieresCreneau = matieresParCreneau[creneau]!;

      for (var matiere in matieresCreneau) {
        if (!matieresSpecialistesCouvertes[creneau]!.contains(matiere)) {
          if (_corrigerSpecialisteManquant(creneau, matiere)) {
            corrections++;
          }
        }
      }
    }
  }

  bool _corrigerSpecialisteManquant(CreneauComplet creneau, Matiere matiere) {
    final specialiste = _trouverSpecialisteOptimal(matiere, creneau);
    if (specialiste != null) {
      final enseignantsActuels = affectations[creneau]!.toList();
      for (var enseignant in enseignantsActuels) {
        if (enseignant.peutEnseigner(matiere) &&
            !estSpecialiste(enseignant, matiere)) {
          _retirerCreneau(enseignant, creneau);
          _affecterCreneau(specialiste, creneau);
          return true;
        }
      }

      _affecterCreneau(specialiste, creneau);
      return true;
    }

    return false;
  }

  void _comblerCreneauxManquants() {
    int totalCombles = 0;

    for (var creneau in capaciteParCreneau.keys) {
      final capacite = capaciteParCreneau[creneau]!.nbProfesseursRequis;
      final actuels = affectations[creneau]!.length;

      if (actuels < capacite) {
        final manquant = capacite - actuels;
        final combles = _comblerCreneauFinal(creneau, manquant);
        totalCombles += combles;
      }
    }
  }

  int _comblerCreneauFinal(CreneauComplet creneau, int manquant) {
    int combles = 0;

    final candidats =
        enseignants.values
            .where((e) => !affectations[creneau]!.contains(e))
            .where(
              (e) =>
                  e.getCreneauxCeJour(creneau.jourSession) < maxCreneauxParJour,
            )
            .where(
              (e) => _peutEnseignerMatiereCreneauSansRemplacerSpecialiste(
                e,
                creneau,
              ),
            )
            .toList()
          ..sort((a, b) {
            final besoinA =
                (minCreneauxParJour * joursParSession) - a.nbSeancesAffectees;
            final besoinB =
                (minCreneauxParJour * joursParSession) - b.nbSeancesAffectees;
            if (besoinA != besoinB) return besoinB.compareTo(besoinA);

            final estSpecialisteA = _estSpecialistePourCreneau(a, creneau);
            final estSpecialisteB = _estSpecialistePourCreneau(b, creneau);
            if (estSpecialisteA && !estSpecialisteB) return 1;
            if (!estSpecialisteA && estSpecialisteB) return -1;

            return _calculerScoreSpecialisationGlobale(
              b,
            ).compareTo(_calculerScoreSpecialisationGlobale(a));
          });

    for (var candidat in candidats) {
      if (combles >= manquant) break;
      if (_peutEtreAffecteAvecTolerance(candidat, creneau)) {
        _affecterCreneau(candidat, creneau);
        combles++;
      }
    }

    return combles;
  }

  bool _peutEnseignerMatiereCreneauSansRemplacerSpecialiste(
    Enseignant enseignant,
    CreneauComplet creneau,
  ) {
    final matieresCreneau = matieresParCreneau[creneau]!;

    for (var matiere in matieresCreneau) {
      if (enseignant.peutEnseigner(matiere)) {
        final capacite = capaciteParCreneau[creneau]!.nbProfesseursRequis;
        final actuels = affectations[creneau]!.length;
        if (actuels < capacite) {
          return true;
        }
      }
    }
    return false;
  }

  bool _estSpecialistePourCreneau(
    Enseignant enseignant,
    CreneauComplet creneau,
  ) {
    final matieresCreneau = matieresParCreneau[creneau]!;
    return matieresCreneau.any(
      (matiere) => estSpecialiste(enseignant, matiere),
    );
  }

  void _optimiserCouvertureMatieres() {
    int ameliorations = 0;

    for (var creneau in capaciteParCreneau.keys) {
      final matieresRequises = matieresParCreneau[creneau]!;

      for (var matiere in matieresRequises) {
        if (!matieresSpecialistesCouvertes[creneau]!.contains(matiere)) {
          if (_corrigerSpecialisteManquant(creneau, matiere)) {
            ameliorations++;
          }
        }
      }

      for (var matiere in matieresRequises) {
        if (!matieresCouvertes[creneau]!.contains(matiere)) {
          if (_corrigerMatiereNonCouverte(creneau, matiere)) {
            ameliorations++;
          }
        }
      }
    }
  }

  bool _corrigerMatiereNonCouverte(CreneauComplet creneau, Matiere matiere) {
    final enseignantCompetent = enseignants.values.firstWhere(
      (e) =>
          e.peutEnseigner(matiere) &&
          !affectations[creneau]!.contains(e) &&
          e.getCreneauxCeJour(creneau.jourSession) < maxCreneauxParJour &&
          _peutEtreAffecteAvecTolerance(e, creneau),
      orElse: () => Enseignant(
        codeSmartexEns: '',
        nom: '',
        prenom: '',
        email: '',
        gradeCode: GradeEnum.pr,
        participeSurveillance: false,
        matieres: [],
      ),
    );

    if (enseignantCompetent.codeSmartexEns.isNotEmpty) {
      _affecterCreneau(enseignantCompetent, creneau);
      return true;
    }

    return false;
  }

  void _corrigerCreneauxUniques() {
    int corrections = 0;

    for (var enseignant in enseignants.values) {
      for (int jour = 1; jour <= joursParSession; jour++) {
        if (enseignant.getCreneauxCeJour(jour) == 1) {
          if (_ajouterCreneauOptimalJour(enseignant, jour)) {
            corrections++;
          } else {
            _retirerCreneauxDuJour(enseignant, jour);
            _affecterSelonBesoinEtCompetence(enseignant, 2);
            corrections++;
          }
        }
      }
    }
  }

  // ========== PHASE 7: OPTIMISATION DES VOEUX ==========
  void _phase7OptimisationVoeux() {
    for (int iteration = 1; iteration <= 20; iteration++) {
      int corrections = _optimiserRespectVoeux();
      if (corrections == 0) break;
    }
  }

  void _phase8AffectationFinaleAggressive() {
    int iterations = 0;

    while (iterations < 50) {
      int affectationsIteration = 0;

      // Try to assign every available teacher to every available slot
      for (var enseignant in enseignants.values) {
        if (enseignant.nbSeancesAffectees >= enseignant.nbSeancesMax) continue;

        for (var creneau in capaciteParCreneau.keys) {
          if (_peutEtreAffecteAvecToleranceLarge(enseignant, creneau)) {
            // Check if teacher can contribute meaningfully
            final matieresCreneau = matieresParCreneau[creneau]!;
            final peutContribuer = matieresCreneau.any(
              (matiere) => enseignant.peutEnseigner(matiere),
            );

            if (peutContribuer) {
              _affecterCreneau(enseignant, creneau);
              affectationsIteration++;

              if (enseignant.nbSeancesAffectees >= enseignant.nbSeancesMax) {
                break; // Teacher is now at max capacity
              }
            }
          }
        }
      }

      if (affectationsIteration == 0) break;
      iterations++;
    }
  }

  void _phase9MaximisationCapacite() {
    // Identifier les enseignants les plus sous-utilisés
    final enseignantsSousUtilises =
        enseignants.values
            .where((e) => e.nbSeancesAffectees < e.nbSeancesMax)
            .toList()
          ..sort((a, b) {
            final tauxA = a.nbSeancesAffectees / a.nbSeancesMax;
            final tauxB = b.nbSeancesAffectees / b.nbSeancesMax;
            if (tauxA.compareTo(tauxB) != 0) return tauxA.compareTo(tauxB);
            return (b.nbSeancesMax - b.nbSeancesAffectees).compareTo(
              a.nbSeancesMax - a.nbSeancesAffectees,
            );
          });

    for (var enseignant in enseignantsSousUtilises) {
      final manquant = enseignant.nbSeancesMax - enseignant.nbSeancesAffectees;
      if (manquant <= 0) continue;

      for (int i = 0; i < manquant; i++) {
        final creneauOptimal = _trouverCreneauPourMaximisation(enseignant);
        if (creneauOptimal != null) {
          _affecterCreneau(enseignant, creneauOptimal);
        } else {
          break;
        }
      }
    }
  }

  CreneauComplet? _trouverCreneauPourMaximisation(Enseignant enseignant) {
    final creneauxEligibles = capaciteParCreneau.keys
        .where(
          (creneau) => _peutEtreAffecteAvecToleranceLarge(enseignant, creneau),
        )
        .toList();

    if (creneauxEligibles.isEmpty) return null;

    // Priorité aux créneaux avec le plus grand besoin
    creneauxEligibles.sort((a, b) {
      final besoinA =
          capaciteParCreneau[a]!.nbProfesseursRequis - affectations[a]!.length;
      final besoinB =
          capaciteParCreneau[b]!.nbProfesseursRequis - affectations[b]!.length;
      if (besoinA != besoinB) return besoinB.compareTo(besoinA);

      // Ensuite par compatibilité matière
      final scoreA = _calculerScoreCompatibiliteMatiere(enseignant, a);
      final scoreB = _calculerScoreCompatibiliteMatiere(enseignant, b);
      return scoreB.compareTo(scoreA);
    });

    return creneauxEligibles.isNotEmpty ? creneauxEligibles.first : null;
  }

  int _optimiserRespectVoeux() {
    int corrections = 0;

    final enseignantsParVoeux = enseignants.values.toList()
      ..sort((a, b) => _voeuxRespectes[a]!.compareTo(_voeuxRespectes[b]!));

    for (var enseignant in enseignantsParVoeux) {
      if (_voeuxRespectes[enseignant]! >=
          _getVoeuxEnseignant(enseignant).length) {
        continue;
      }

      final correctionsEnseignant = _optimiserVoeuxEnseignant(enseignant);
      corrections += correctionsEnseignant;
    }

    return corrections;
  }

  int _optimiserVoeuxEnseignant(Enseignant enseignant) {
    int corrections = 0;
    final voeux = _getVoeuxEnseignant(enseignant);

    for (var voeu in voeux) {
      if (_estDejaAffecteSurVoeu(enseignant, voeu)) continue;

      final creneauVoeu = _trouverCreneauCorrespondant(voeu);
      if (creneauVoeu == null) continue;

      if (_peutEtreAffecteStrict(enseignant, creneauVoeu)) {
        final creneauMoinsUtile = _trouverCreneauEchangeable(
          enseignant,
          creneauVoeu,
        );
        if (creneauMoinsUtile != null) {
          _retirerCreneau(enseignant, creneauMoinsUtile);
          _affecterCreneau(enseignant, creneauVoeu);
          corrections++;
          break;
        }
      }
    }

    return corrections;
  }

  // ========== FONCTIONS UTILITAIRES VOEUX ==========
  bool _estVoeuEnseignant(Enseignant enseignant, CreneauComplet creneau) {
    final voeux = voeuxParEnseignant[enseignant.codeSmartexEns];
    if (voeux == null) return false;

    return voeux.any(
      (voeu) =>
          voeu.jour == creneau.jourSession && voeu.seance == creneau.seance,
    );
  }

  int _calculerBonusVoeux(Enseignant enseignant, CreneauComplet creneau) {
    return _estVoeuEnseignant(enseignant, creneau) ? 25 : 0;
  }

  bool _estDejaAffecteSurVoeu(Enseignant enseignant, Voeux voeu) {
    return enseignant.creneauxAffectes.any(
      (creneau) =>
          creneau.jourSession == voeu.jour && creneau.seance == voeu.seance,
    );
  }

  CreneauComplet? _trouverCreneauCorrespondant(Voeux voeu) {
    for (var creneau in capaciteParCreneau.keys) {
      if (creneau.jourSession == voeu.jour && creneau.seance == voeu.seance) {
        return creneau;
      }
    }
    return null;
  }

  CreneauComplet? _trouverCreneauEchangeable(
    Enseignant enseignant,
    CreneauComplet nouveauCreneau,
  ) {
    final creneauxActuels = enseignant.creneauxAffectes.toList()
      ..sort(
        (a, b) => _calculerScoreCreneauComplet(
          enseignant,
          a,
        ).compareTo(_calculerScoreCreneauComplet(enseignant, b)),
      );

    for (var creneau in creneauxActuels) {
      if (!_estVoeuEnseignant(enseignant, creneau) &&
          creneau.jourSession == nouveauCreneau.jourSession) {
        return creneau;
      }
    }

    return null;
  }

  List<Voeux> _getVoeuxEnseignant(Enseignant enseignant) {
    return voeuxParEnseignant[enseignant.codeSmartexEns] ?? [];
  }

  void _garantirMinimumPourTous() {
    int affectationsAjoutees = 0;
    bool changement = true;

    while (changement && affectationsAjoutees < 200) {
      changement = false;

      // Trier par les PLUS sous-affectés
      final enseignantsTries = enseignants.values.toList()
        ..sort((a, b) {
          // Priorité aux enseignants avec le PLUS GRAND BESOIN
          final besoinA =
              (minCreneauxParJour * joursParSession) - a.nbSeancesAffectees;
          final besoinB =
              (minCreneauxParJour * joursParSession) - b.nbSeancesAffectees;
          if (besoinA != besoinB) return besoinB.compareTo(besoinA);

          // Ensuite par nombre de jours avec problème
          final problemesA = _compterJoursIncompletsEnseignant();
          final problemesB = _compterJoursIncompletsEnseignant();
          return problemesB.compareTo(problemesA);
        });

      for (var enseignant in enseignantsTries) {
        final besoinGlobal =
            (minCreneauxParJour * joursParSession) -
            enseignant.nbSeancesAffectees;

        if (besoinGlobal > 0) {
          // Essayer d'ajouter des créneaux pour cet enseignant
          for (int i = 0; i < besoinGlobal; i++) {
            final creneauOptimal = _trouverCreneauPourRemplissageAgressif(
              enseignant,
            );
            if (creneauOptimal != null) {
              _affecterCreneau(enseignant, creneauOptimal);
              affectationsAjoutees++;
              changement = true;
              break; // Un créneau à la fois pour réévaluer les priorités
            }
          }
        }
      }
    }
  }

  void _validationFinaleRenforcee() {
    // Vérifier et corriger TOUS les enseignants avec des jours incomplets
    for (var enseignant in enseignants.values) {
      for (int jour = 1; jour <= joursParSession; jour++) {
        final creneauxCeJour = enseignant.getCreneauxCeJour(jour);
        if (creneauxCeJour == 1) {
          // Essayer d'ajouter un créneau
          if (!_ajouterCreneauOptimalJour(enseignant, jour)) {
            // Si impossible, RETIRER le créneau unique
            _retirerCreneauxDuJour(enseignant, jour);
          }
        }
      }
    }
  }

  CreneauComplet? _trouverCreneauPourRemplissageAgressif(
    Enseignant enseignant,
  ) {
    // Recherche TRÈS LARGE des créneaux éligibles
    final creneauxEligibles = capaciteParCreneau.keys
        .where(
          (creneau) => _peutEtreAffecteAvecToleranceLarge(enseignant, creneau),
        )
        .toList();

    if (creneauxEligibles.isEmpty) return null;

    // Priorité aux créneaux avec le PLUS GRAND BESOIN
    creneauxEligibles.sort((a, b) {
      final besoinA =
          capaciteParCreneau[a]!.nbProfesseursRequis - affectations[a]!.length;
      final besoinB =
          capaciteParCreneau[b]!.nbProfesseursRequis - affectations[b]!.length;
      if (besoinA != besoinB) return besoinB.compareTo(besoinA);

      // Ensuite par compatibilité matière
      final scoreA = _calculerScoreCompatibiliteMatiere(enseignant, a);
      final scoreB = _calculerScoreCompatibiliteMatiere(enseignant, b);
      return scoreB.compareTo(scoreA);
    });

    return creneauxEligibles.isNotEmpty ? creneauxEligibles.first : null;
  }

  bool _peutEtreAffecteAvecToleranceLarge(
    Enseignant enseignant,
    CreneauComplet creneau,
  ) {
    // Vérifications de base
    if (enseignant.nbSeancesAffectees >= enseignant.nbSeancesMax) return false;
    if (enseignant.creneauxAffectes.contains(creneau)) return false;
    if (enseignant.getCreneauxCeJour(creneau.jourSession) >=
        maxCreneauxParJour) {
      return false;
    }

    // Vérification de capacité avec TOLÉRANCE ÉLARGIE
    final capacite = capaciteParCreneau[creneau]!.nbProfesseursRequis;
    final maxAutorise = (capacite * 1.20)
        .ceil(); // 20% de tolérance au lieu de 10%

    return affectations[creneau]!.length < maxAutorise;
  }

  int _calculerScoreCompatibiliteMatiere(
    Enseignant enseignant,
    CreneauComplet creneau,
  ) {
    final matieresCreneau = matieresParCreneau[creneau]!;
    int score = 0;

    for (var matiere in matieresCreneau) {
      if (enseignant.peutEnseigner(matiere)) {
        score += 10;
        if (estSpecialiste(enseignant, matiere)) {
          score += 5;
        }
      }
    }

    return score;
  }

  // ========== FONCTIONS UTILITAIRES GÉNÉRALES ==========
  bool _peutEtreAffecteStrict(Enseignant enseignant, CreneauComplet creneau) {
    if (enseignant.nbSeancesAffectees >= enseignant.nbSeancesMax) return false;
    if (enseignant.creneauxAffectes.contains(creneau)) return false;
    if (enseignant.getCreneauxCeJour(creneau.jourSession) >=
        maxCreneauxParJour) {
      return false;
    }

    // Allow assignment if teacher can teach ANY subject in the timeslot
    // and capacity isn't exceeded (with tolerance)
    final matieresCreneau = matieresParCreneau[creneau]!;
    final peutEnseigner = matieresCreneau.any(
      (matiere) => enseignant.peutEnseigner(matiere),
    );

    if (!peutEnseigner) return false;

    // Use tolerance for capacity check
    final capacite = capaciteParCreneau[creneau]!.nbProfesseursRequis;
    final maxAutorise = (capacite * toleranceCapacite).ceil();
    return affectations[creneau]!.length < maxAutorise;
  }

  bool _peutEtreAffecteAvecTolerance(
    Enseignant enseignant,
    CreneauComplet creneau,
  ) {
    if (enseignant.nbSeancesAffectees >= enseignant.nbSeancesMax) return false;
    if (enseignant.creneauxAffectes.contains(creneau)) return false;
    if (enseignant.getCreneauxCeJour(creneau.jourSession) >=
        maxCreneauxParJour) {
      return false;
    }

    final capacite = capaciteParCreneau[creneau]!.nbProfesseursRequis;
    final maxAutorise = (capacite * toleranceCapacite).ceil();
    return affectations[creneau]!.length < maxAutorise;
  }

  bool _ajouterCreneauOptimalJour(Enseignant enseignant, int jour) {
    final creneauxDisponibles = capaciteParCreneau.keys
        .where((c) => c.jourSession == jour)
        .where((c) => _peutEtreAffecteStrict(enseignant, c))
        .toList();

    if (creneauxDisponibles.isEmpty) return false;

    creneauxDisponibles.sort((a, b) {
      return _calculerScoreCreneauComplet(
        enseignant,
        b,
      ).compareTo(_calculerScoreCreneauComplet(enseignant, a));
    });

    _affecterCreneau(enseignant, creneauxDisponibles.first);
    return true;
  }

  void _affecterCreneau(Enseignant enseignant, CreneauComplet creneau) {
    affectations[creneau]!.add(enseignant);
    enseignant.ajouterCreneau(creneau);
    _mettreAJourMatieresCouvertes(creneau, enseignant);
    _mettreAJourCompteursDistribution(enseignant, creneau.jourSession, 1);
    _mettreAJourConsecutifs(enseignant, creneau.jourSession);

    if (_estVoeuEnseignant(enseignant, creneau)) {
      _voeuxRespectes[enseignant] = _voeuxRespectes[enseignant]! + 1;
    }
  }

  void _retirerCreneau(Enseignant enseignant, CreneauComplet creneau) {
    affectations[creneau]!.remove(enseignant);
    enseignant.retirerCreneau(creneau);
    _mettreAJourCompteursDistribution(enseignant, creneau.jourSession, -1);
    _mettreAJourConsecutifs(enseignant, creneau.jourSession);

    if (_estVoeuEnseignant(enseignant, creneau)) {
      _voeuxRespectes[enseignant] = max(0, _voeuxRespectes[enseignant]! - 1);
    }
  }

  void _retirerCreneauxDuJour(Enseignant enseignant, int jour) {
    final creneauxARetirer = enseignant.creneauxAffectes
        .where((c) => c.jourSession == jour)
        .toList();
    for (var creneau in creneauxARetirer) {
      _retirerCreneau(enseignant, creneau);
    }
  }

  void _mettreAJourCompteursDistribution(
    Enseignant enseignant,
    int jour,
    int delta,
  ) {
    final ancienNb = enseignant.getCreneauxCeJour(jour);
    final nouveauNb = ancienNb + delta;

    if (ancienNb == 2) {
      enseignantsAvec2Creneaux[jour] = enseignantsAvec2Creneaux[jour]! - 1;
    }
    if (ancienNb == 3) {
      enseignantsAvec3Creneaux[jour] = enseignantsAvec3Creneaux[jour]! - 1;
    }

    if (nouveauNb == 2) {
      enseignantsAvec2Creneaux[jour] = enseignantsAvec2Creneaux[jour]! + 1;
    }
    if (nouveauNb == 3) {
      enseignantsAvec3Creneaux[jour] = enseignantsAvec3Creneaux[jour]! + 1;
    }

    if (ancienNb == 0 && nouveauNb > 0) {
      totalEnseignantsParJour[jour] = totalEnseignantsParJour[jour]! + 1;
    } else if (ancienNb > 0 && nouveauNb == 0) {
      totalEnseignantsParJour[jour] = totalEnseignantsParJour[jour]! - 1;
    }
  }

  void _mettreAJourMatieresCouvertes(
    CreneauComplet creneau,
    Enseignant enseignant,
  ) {
    for (var matiere in enseignant.matieres) {
      if (matieresParCreneau[creneau]!.contains(matiere)) {
        matieresCouvertes[creneau]!.add(matiere);

        if (estSpecialiste(enseignant, matiere)) {
          matieresSpecialistesCouvertes[creneau]!.add(matiere);
        }
      }
    }
  }

  void _mettreAJourConsecutifs(Enseignant enseignant, int jour) {
    final creneauxJour = enseignant.creneauxAffectes
        .where((c) => c.jourSession == jour)
        .map((c) => c.seance)
        .toSet();

    _consecutifsParJour[enseignant]![jour] = _calculerScoreConsecutifAmeliore(
      creneauxJour,
    );
  }

  CreneauComplet? _trouverCreneauMoinsUtile(
    Enseignant enseignant,
    List<CreneauComplet> creneaux,
  ) {
    if (creneaux.isEmpty) return null;

    CreneauComplet? creneauMoinsUtile;
    int scoreMin = 1000;

    for (var creneau in creneaux) {
      final score = _calculerScoreCreneauComplet(enseignant, creneau);
      if (score < scoreMin) {
        scoreMin = score;
        creneauMoinsUtile = creneau;
      }
    }

    return creneauMoinsUtile;
  }

  int _calculerScoreSpecialisationGlobale(Enseignant enseignant) {
    final scoreGrade =
        {
          GradeEnum.pr: 10,
          GradeEnum.ma: 8,
          GradeEnum.ptc: 7,
          GradeEnum.mc: 6,
          GradeEnum.ex: 5,
          GradeEnum.ac: 4,
          GradeEnum.as: 3,
          GradeEnum.v: 1,
        }[enseignant.gradeCode] ??
        0;

    return scoreGrade + enseignant.matieres.length;
  }

  // ========== CALCULS DISTRIBUTION ==========
  Map<String, int> _getStatsDistributionJour(int jour) {
    final total = totalEnseignantsParJour[jour]!;
    final cible2 = (total * pourcentage2CreneauxParJour).round();
    final cible3 = (total * pourcentage3CreneauxParJour).round();

    final actuels2 = enseignantsAvec2Creneaux[jour]!;
    final actuels3 = enseignantsAvec3Creneaux[jour]!;

    return {
      'cible2': cible2,
      'cible3': cible3,
      'actuels2': actuels2,
      'actuels3': actuels3,
      'manque_2': max(0, cible2 - actuels2),
      'manque_3': max(0, cible3 - actuels3),
      'exces_2': max(0, actuels2 - cible2),
      'exces_3': max(0, actuels3 - cible3),
    };
  }

  bool _distributionGlobalementRespectee() {
    for (int jour = 1; jour <= joursParSession; jour++) {
      final stats = _getStatsDistributionJour(jour);
      if (stats['manque_2']! > toleranceDistribution ||
          stats['manque_3']! > toleranceDistribution) {
        return false;
      }
    }
    return true;
  }

  // ========== VALIDATION ==========
  void _validerDonneesEntree() {
    if (enseignants.isEmpty) throw 'Aucun enseignant fourni';
    if (capaciteParCreneau.isEmpty) throw 'Aucun créneau fourni';

    capaciteParCreneau.values
        .map((c) => c.nbProfesseursRequis)
        .reduce((a, b) => a + b);

    enseignants.values.map((e) => e.nbSeancesMax).reduce((a, b) => a + b);

    // Count total required teachers from exams
    examensParCreneau.values.fold(0, (sum, codes) => sum + codes.length);
  }

  // ========== RÉSULTATS ==========
  Map<String, dynamic> _genererResultatsComplets() {
    return {
      'affectations_par_creneau': _genererStatsCreneaux(),
      'statistiques_globales': _calculerStatistiquesGlobales(),
      'enseignants': _genererStatsEnseignants(),
      'voeux_respectes': _calculerStatistiquesVoeux(),
    };
  }

  Map<String, dynamic> _genererStatsCreneaux() {
    final stats = <String, dynamic>{};

    for (var creneau in capaciteParCreneau.keys) {
      final total = affectations[creneau]!.length;
      final capacite = capaciteParCreneau[creneau]!;

      final specialistes = affectations[creneau]!.where((enseignant) {
        final matieresCreneau = matieresParCreneau[creneau]!;
        return matieresCreneau.any(
          (matiere) => estSpecialiste(enseignant, matiere),
        );
      }).length;

      stats[creneau.toString()] = {
        'jour': creneau.jourSession,
        'seance': creneau.seance,
        'codeCreneau': creneau.codeCreneau,
        'capacite_requise': capacite.nbProfesseursRequis,
        'total_enseignants': total,
        'specialistes': specialistes,
        'non_specialistes': total - specialistes,
        'taux_remplissage': (total / capacite.nbProfesseursRequis * 100)
            .toStringAsFixed(1),
        'enseignants': affectations[creneau]!
            .map((e) => e.toDetailedString())
            .toList(),
      };
    }

    return stats;
  }

  Map<String, dynamic> _calculerStatistiquesGlobales() {
    int totalBesoins = 0;
    int totalAffectes = 0;
    int totalSalles = 0;

    for (var creneau in capaciteParCreneau.keys) {
      totalBesoins += capaciteParCreneau[creneau]!.nbProfesseursRequis;
      totalAffectes += affectations[creneau]!.length;
      totalSalles += capaciteParCreneau[creneau]!.nbSalles;
    }

    int totalBlocsConsecutifs = 0;
    int totalEnseignantsAvecBlocs = 0;

    for (var enseignant in enseignants.values) {
      final blocs = _blocsConsecutifs[enseignant]!;
      if (blocs > 0) {
        totalBlocsConsecutifs += blocs;
        totalEnseignantsAvecBlocs++;
      }
    }

    final distributionParJour = <int, Map<String, dynamic>>{};
    for (int jour = 1; jour <= joursParSession; jour++) {
      final stats = _getStatsDistributionJour(jour);
      distributionParJour[jour] = {
        'cible_2_creneaux': stats['cible2'],
        'reel_2_creneaux': stats['actuels2'],
        'cible_3_creneaux': stats['cible3'],
        'reel_3_creneaux': stats['actuels3'],
        'respecte':
            stats['manque_2']! <= toleranceDistribution &&
            stats['manque_3']! <= toleranceDistribution,
      };
    }

    final statsQuotidiennes = _calculerStatistiquesQuotidiennes();

    return {
      'total_enseignants': enseignants.length,
      'total_enseignants_utilises': enseignants.values
          .where((e) => e.nbSeancesAffectees > 0)
          .length,
      'total_creneaux': capaciteParCreneau.length,
      'total_salles': totalSalles,
      'total_besoins': totalBesoins,
      'total_affectations': totalAffectes,
      'taux_remplissage_global': (totalAffectes / totalBesoins * 100)
          .toStringAsFixed(1),
      'statistiques_consecution': {
        'total_blocs_consecutifs': totalBlocsConsecutifs,
        'enseignants_avec_blocs': totalEnseignantsAvecBlocs,
        'taux_enseignants_blocs':
            (totalEnseignantsAvecBlocs / enseignants.length * 100)
                .toStringAsFixed(1),
      },
      'distribution_par_jour': distributionParJour,
      'couverture_specialistes': _calculerTauxCouvertureSpecialistes(),
      'contraintes_quotidiennes': statsQuotidiennes,
    };
  }

  Map<String, dynamic> _calculerStatistiquesQuotidiennes() {
    int totalJours = 0;
    int joursConformes = 0;
    int joursAvecMinimum = 0;
    int joursAvecConsecutifs = 0;

    for (var enseignant in enseignants.values) {
      for (int jour = 1; jour <= joursParSession; jour++) {
        final creneauxCeJour = enseignant.getCreneauxCeJour(jour);
        if (creneauxCeJour > 0) {
          totalJours++;
          if (creneauxCeJour >= minCreneauxParJour) {
            joursAvecMinimum++;
          }
          if (creneauxCeJour >= 2) {
            final creneauxDuJour = enseignant.creneauxAffectes
                .where((c) => c.jourSession == jour)
                .toList();
            if (_sontCreneauxConsecutifs(creneauxDuJour)) {
              joursAvecConsecutifs++;
            }
          }
        }
      }
    }

    joursConformes = min(joursAvecMinimum, joursAvecConsecutifs);

    return {
      'total_jours': totalJours,
      'jours_avec_minimum': joursAvecMinimum,
      'jours_avec_consecutifs': joursAvecConsecutifs,
      'jours_conformes': joursConformes,
      'taux_conformite': totalJours > 0
          ? (joursConformes / totalJours * 100).toStringAsFixed(1)
          : '100.0',
    };
  }

  Map<String, dynamic> _calculerTauxCouvertureSpecialistes() {
    int totalMatieres = 0;
    int matieresAvecSpecialiste = 0;

    for (var creneau in capaciteParCreneau.keys) {
      final matieresCreneau = matieresParCreneau[creneau]!;
      totalMatieres += matieresCreneau.length;

      for (var matiere in matieresCreneau) {
        if (matieresSpecialistesCouvertes[creneau]!.contains(matiere)) {
          matieresAvecSpecialiste++;
        }
      }
    }

    return {
      'total_matieres': totalMatieres,
      'matieres_avec_specialiste': matieresAvecSpecialiste,
      'taux_couverture': totalMatieres > 0
          ? (matieresAvecSpecialiste / totalMatieres * 100).toStringAsFixed(1)
          : '0.0',
    };
  }

  Map<String, dynamic> _calculerStatistiquesVoeux() {
    int totalVoeux = 0;
    int voeuRespectes = 0;
    final detailsParEnseignant = <String, dynamic>{};

    for (var enseignant in enseignants.values) {
      final voeux = _getVoeuxEnseignant(enseignant);
      final respectes = _voeuxRespectes[enseignant]!;

      totalVoeux += voeux.length;
      voeuRespectes += respectes;

      detailsParEnseignant[enseignant.codeSmartexEns] = {
        'nom': enseignant.nom,
        'total_voeux': voeux.length,
        'voeux_respectes': respectes,
        'taux_respect': voeux.length > 0
            ? (respectes / voeux.length * 100).toStringAsFixed(1)
            : '100.0',
      };
    }

    return {
      'total_voeux': totalVoeux,
      'voeux_respectes': voeuRespectes,
      'taux_respect_global': totalVoeux > 0
          ? (voeuRespectes / totalVoeux * 100).toStringAsFixed(1)
          : '100.0',
      'details_par_enseignant': detailsParEnseignant,
    };
  }

  Map<String, dynamic> _genererStatsEnseignants() {
    final stats = <String, dynamic>{};

    for (var enseignant in enseignants.values) {
      final blocsConsecutifs = _calculerBlocsConsecutifsEnseignant(enseignant);

      stats[enseignant.codeSmartexEns] = {
        'nom': '${enseignant.prenom} ${enseignant.nom}',
        'grade': enseignant.gradeCode.toString(),
        'total_creneaux': enseignant.nbSeancesAffectees,
        'creneaux_par_jour': {
          for (int jour = 1; jour <= joursParSession; jour++)
            jour: enseignant.getCreneauxCeJour(jour),
        },
        'blocs_consecutifs': blocsConsecutifs,
        'matieres_specialise': enseignant.matieres
            .map((m) => m.toString())
            .toList(),
        'voeux_respectes': _voeuxRespectes[enseignant]!,
        'total_voeux': _getVoeuxEnseignant(enseignant).length,
        'participe_surveillance': enseignant.participeSurveillance,
        'creneaux_affectes': enseignant.creneauxAffectes
            .map((c) => c.toString())
            .toList(),
      };
    }

    return stats;
  }

  Map<String, dynamic> _calculerBlocsConsecutifsEnseignant(
    Enseignant enseignant,
  ) {
    final blocs = <String, int>{};

    for (int jour = 1; jour <= joursParSession; jour++) {
      final creneauxJour =
          enseignant.creneauxAffectes
              .where((c) => c.jourSession == jour)
              .map((c) => c.seance)
              .toList()
            ..sort();

      if (creneauxJour.length >= 2) {
        int consecutifs = _compterConsecutifs(
          enseignant.creneauxAffectes
              .where((c) => c.jourSession == jour)
              .toList(),
        );

        if (consecutifs > 0) {
          blocs['jour_$jour'] = consecutifs;
        }
      }
    }

    return {
      'total_blocs': blocs.length,
      'details_blocs': blocs,
      'score_consecutif': _consecutifsParJour[enseignant]!.reduce(
        (a, b) => a + b,
      ),
    };
  }

  Map<String, dynamic> _genererResultatsAvecErreur(dynamic erreur) {
    return {
      'erreur': erreur.toString(),
      'affectations_partiels': affectations,
      'statistiques_partiels': _calculerStatistiquesGlobales(),
    };
  }
}

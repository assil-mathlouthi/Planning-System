import 'dart:collection';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/grade.dart' as core_grade;
import 'package:planning_system/core/enums/seance.dart' as core_seance;
import 'package:planning_system/core/enums/semestre.dart' as core_semestre;
import 'package:planning_system/core/enums/session.dart' as core_session;

// Algorithm imports (use alias to avoid name clashes with core enums)
import 'package:planning_system/algo/algorithme.dart' as alg;
import 'package:planning_system/algo/enums.dart' as alg_enums;
import 'package:planning_system/algo/models/creanau.dart' as alg_models;
import 'package:planning_system/algo/models/enseignant.dart' as alg_models;
import 'package:planning_system/algo/models/matiere.dart' as alg_models;
import 'package:planning_system/algo/models/session_config.dart' as alg_models;
import 'package:planning_system/algo/models/voeux.dart' as alg_models;

/// Orchestrates loading data from the app DB, running the scheduling algorithm,
/// and persisting the generated affectations into the DB.
class AlgoOrchestrator extends GetxController {
  final AppDb db = Get.find<AppDb>();

  Future<void> generateAndSave() async {
    // 1) Load inputs from DB and map to algo models
    final enseignants = await _loadEnseignants();
    final creneauxData = await _loadCreneaux();
    final examensParCreneau = await _loadExamensParCreneau(creneauxData);
    final voeuxParEnseignant = await _loadVoeux();

    // Provide a generic matiere to allow competence checks even if
    // we don't have exam->matiere mapping.
    final genericMatiere = alg_models.Matiere(
      id: 'GEN',
      libelle: 'Surveillance',
    );
    final matieresParCreneau =
        <alg_models.CreneauComplet, List<alg_models.Matiere>>{
          for (final c in creneauxData.creneaux) c: [genericMatiere],
        };

    final capaciteParCreneau =
        <alg_models.CreneauComplet, alg_models.CreneauCapacity>{
          for (final c in creneauxData.creneaux)
            c: alg_models.CreneauCapacity(
              nbSalles: creneauxData.nbSallesByCode[c.codeCreneau] ?? 0,
              nbProfesseursRequis:
                  (creneauxData.nbSallesByCode[c.codeCreneau] ?? 0) * 2,
              exces: 0,
            ),
        };

    // Build session config: infer from creneaux dates and voeux when possible
    final nbJours = creneauxData.uniqueDates.length;
    final inferredSemestre = await _inferSemestre(
      voeuxParEnseignant.values.expand((e) => e).toList(),
    );
    final inferredSession = await _inferSession(
      voeuxParEnseignant.values.expand((e) => e).toList(),
    );
    final config = alg_models.SessionConfig(
      id: 1,
      semestre: inferredSemestre,
      session: inferredSession,
      nbJours: nbJours,
      maxCreneauxParJour: 3,
      pourcentageMaxCreneaux: 0.2,
    );

    // 2) Run algorithm
    final algo = alg.AlgorithmeAffectation(
      enseignants: enseignants,
      capaciteParCreneau: capaciteParCreneau,
      matieresParCreneau: matieresParCreneau,
      voeuxParEnseignant: voeuxParEnseignant,
      config: config,
      examensParCreneau: examensParCreneau,
    );

    log(
      'Running scheduling algorithm with ${enseignants.length} enseignants, '
      '${capaciteParCreneau.length} creneaux, and ${examensParCreneau.length} exam groups',
    );
    algo.executer();

    // 3) Persist results into affection_table
    await _persistAffectations(
      algo: algo,
      codeCreneauIndex: creneauxData.byCode,
      semestre: inferredSemestre,
      session: inferredSession,
    );
  }

  // ---------- Loaders ----------
  Future<Map<String, alg_models.Enseignant>> _loadEnseignants() async {
    final rows = await db.select(db.enseignantsTable).get();

    // Load matieres mapping
    final emRows = await db.select(db.enseignantMatiereTable).get();
    final matieresRows = await db.select(db.matiereTable).get();
    final matiereByCode = {for (final m in matieresRows) m.codeMatiere: m};
    final matieresByTeacher = <String, List<alg_models.Matiere>>{};
    for (final em in emRows) {
      final m = matiereByCode[em.codeMatiere];
      if (m == null) continue;
      matieresByTeacher.putIfAbsent(em.codeSmartexEns, () => []);
      matieresByTeacher[em.codeSmartexEns]!.add(
        alg_models.Matiere(id: m.codeMatiere, libelle: m.label),
      );
    }

    final map = <String, alg_models.Enseignant>{};
    for (final e in rows) {
      final grade = _mapGrade(e.gradeCodeEns);
      final mats =
          matieresByTeacher[e.codeSmartexEns] ?? <alg_models.Matiere>[];
      // Add generic surveillance matiere to allow assignment regardless of teaching subjects
      if (!mats.any((m) => m.id == 'GEN')) {
        mats.add(alg_models.Matiere(id: 'GEN', libelle: 'Surveillance'));
      }
      map[e.codeSmartexEns] = alg_models.Enseignant(
        codeSmartexEns: e.codeSmartexEns,
        nom: e.nomEns,
        prenom: e.prenomEns,
        email: e.emailEns,
        gradeCode: grade,
        participeSurveillance: e.participeSurveillance,
        matieres: mats,
      );
    }
    return map;
  }

  Future<_CreneauxData> _loadCreneaux() async {
    final rows = await db.select(db.creneauTable).get();
    // Compute jour indices by sorting unique dates
    final uniqueDates = SplayTreeSet<DateTime>.from(
      rows.map(
        (r) => DateTime(
          r.dateCreneau.year,
          r.dateCreneau.month,
          r.dateCreneau.day,
        ),
      ),
    ).toList(growable: false);
    final dateToJour = <DateTime, int>{
      for (int i = 0; i < uniqueDates.length; i++) uniqueDates[i]: i + 1,
    };

    alg_enums.SeanceEnum _mapSeance(core_seance.SeanceEnum s) {
      switch (s) {
        case core_seance.SeanceEnum.s1:
          return alg_enums.SeanceEnum.s1;
        case core_seance.SeanceEnum.s2:
          return alg_enums.SeanceEnum.s2;
        case core_seance.SeanceEnum.s3:
          return alg_enums.SeanceEnum.s3;
        case core_seance.SeanceEnum.s4:
          return alg_enums.SeanceEnum.s4;
      }
    }

    final byCode = <int, alg_models.CreneauComplet>{};
    final nbSallesByCode = <int, int>{};
    final creneaux = <alg_models.CreneauComplet>[];
    for (final r in rows) {
      final dayKey = DateTime(
        r.dateCreneau.year,
        r.dateCreneau.month,
        r.dateCreneau.day,
      );
      final jour = dateToJour[dayKey] ?? 1;
      final c = alg_models.CreneauComplet(
        jourSession: jour,
        seance: _mapSeance(r.seance),
        codeCreneau: r.codeCreneau,
        dateCreneau: r.dateCreneau,
      );
      byCode[r.codeCreneau] = c;
      nbSallesByCode[r.codeCreneau] = r.nbSalle;
      creneaux.add(c);
    }

    return _CreneauxData(
      uniqueDates: uniqueDates,
      byCode: byCode,
      nbSallesByCode: nbSallesByCode,
      creneaux: creneaux,
    );
  }

  Future<Map<alg_models.CreneauComplet, List<String>>> _loadExamensParCreneau(
    _CreneauxData creneauxData,
  ) async {
    final rows = await db.select(db.examenTable).get();
    final grouped = <int, Set<String>>{}; // codeCreneau -> unique teacher codes
    for (final r in rows) {
      grouped
          .putIfAbsent(r.codeCreneau, () => <String>{})
          .add(r.codeSmartexEns);
    }

    final map = <alg_models.CreneauComplet, List<String>>{};
    for (final entry in grouped.entries) {
      final creneau = creneauxData.byCode[entry.key];
      if (creneau == null) continue; // stale exam referencing non-existing slot
      map[creneau] = entry.value.toList();
    }
    return map;
  }

  Future<Map<String, List<alg_models.Voeux>>> _loadVoeux() async {
    final rows = await db.select(db.voeuxTable).get();
    final result = <String, List<alg_models.Voeux>>{};
    for (final v in rows) {
      result.putIfAbsent(v.codeSmartexEns, () => []);
      result[v.codeSmartexEns]!.add(
        alg_models.Voeux(
          id: v.id,
          semestre: _mapSemestre(v.semestre),
          session: _mapSession(v.session),
          codeSmartexEns: v.codeSmartexEns,
          jour: v.jour,
          seance: _mapSeance(v.seance),
        ),
      );
    }
    return result;
  }

  // ---------- Persist ----------
  Future<void> _persistAffectations({
    required alg.AlgorithmeAffectation algo,
    required Map<int, alg_models.CreneauComplet> codeCreneauIndex,
    required alg_enums.Semestre semestre,
    required alg_enums.Session session,
  }) async {
    // Build reverse index: CreneauComplet -> codeCreneau
    final reverseIndex = <alg_models.CreneauComplet, int>{
      for (final e in codeCreneauIndex.entries) e.value: e.key,
    };

    // Optional: clear existing records before inserting new ones
    await db.delete(db.affectionTable).go();

    final inserts = <AffectionTableCompanion>[];
    for (final entry in algo.affectations.entries) {
      final code = reverseIndex[entry.key];
      if (code == null) continue; // should not happen
      for (final enseignant in entry.value) {
        inserts.add(
          AffectionTableCompanion.insert(
            codeCreneau: code,
            codeSmartexEns: enseignant.codeSmartexEns,
            semestre: _mapSemestreBack(semestre),
            session: _mapSessionBack(session),
          ),
        );
      }
    }

    if (inserts.isNotEmpty) {
      await db.batch((b) => b.insertAll(db.affectionTable, inserts));
    }
    log('Persisted ${inserts.length} affectations');
  }

  // ---------- Mappers ----------
  alg_enums.GradeEnum _mapGrade(core_grade.GradeEnum g) {
    switch (g) {
      case core_grade.GradeEnum.pr:
        return alg_enums.GradeEnum.PR;
      case core_grade.GradeEnum.ma:
        return alg_enums.GradeEnum.MA;
      case core_grade.GradeEnum.v:
        return alg_enums.GradeEnum.VA;
      case core_grade.GradeEnum.ptc:
        return alg_enums.GradeEnum.PTC;
      case core_grade.GradeEnum.ac:
        return alg_enums.GradeEnum.AC;
      case core_grade.GradeEnum.as:
        return alg_enums.GradeEnum.AS;
      case core_grade.GradeEnum.ex:
        return alg_enums.GradeEnum.EX;
      case core_grade.GradeEnum.pes:
        return alg_enums.GradeEnum.MA; // closest fallback
      case core_grade.GradeEnum.mc:
        return alg_enums.GradeEnum.MC;
    }
  }

  alg_enums.Semestre _mapSemestre(core_semestre.SemestreEnum s) {
    switch (s) {
      case core_semestre.SemestreEnum.sem1:
        return alg_enums.Semestre.S1;
      case core_semestre.SemestreEnum.sem2:
        return alg_enums.Semestre.S2;
    }
  }

  alg_enums.Session _mapSession(core_session.SessionEnum s) {
    switch (s) {
      case core_session.SessionEnum.partiel:
        return alg_enums.Session.Partial;
      case core_session.SessionEnum.principale:
        return alg_enums.Session.Continue;
    }
  }

  core_semestre.SemestreEnum _mapSemestreBack(alg_enums.Semestre s) {
    switch (s) {
      case alg_enums.Semestre.S1:
        return core_semestre.SemestreEnum.sem1;
      case alg_enums.Semestre.S2:
        return core_semestre.SemestreEnum.sem2;
    }
  }

  core_session.SessionEnum _mapSessionBack(alg_enums.Session s) {
    switch (s) {
      case alg_enums.Session.Partial:
        return core_session.SessionEnum.partiel;
      case alg_enums.Session.Continue:
        return core_session.SessionEnum.principale;
    }
  }

  alg_enums.SeanceEnum _mapSeance(core_seance.SeanceEnum s) {
    switch (s) {
      case core_seance.SeanceEnum.s1:
        return alg_enums.SeanceEnum.s1;
      case core_seance.SeanceEnum.s2:
        return alg_enums.SeanceEnum.s2;
      case core_seance.SeanceEnum.s3:
        return alg_enums.SeanceEnum.s3;
      case core_seance.SeanceEnum.s4:
        return alg_enums.SeanceEnum.s4;
    }
  }

  Future<alg_enums.Semestre> _inferSemestre(
    List<alg_models.Voeux> voeux,
  ) async {
    if (voeux.isNotEmpty) return voeux.first.semestre;
    return alg_enums.Semestre.S1;
  }

  Future<alg_enums.Session> _inferSession(List<alg_models.Voeux> voeux) async {
    if (voeux.isNotEmpty) return voeux.first.session;
    return alg_enums.Session.Partial;
  }
}

class _CreneauxData {
  final List<DateTime> uniqueDates;
  final Map<int, alg_models.CreneauComplet> byCode;
  final Map<int, int> nbSallesByCode;
  final List<alg_models.CreneauComplet> creneaux;

  _CreneauxData({
    required this.uniqueDates,
    required this.byCode,
    required this.nbSallesByCode,
    required this.creneaux,
  });
}

class SeanceMappingResult {}

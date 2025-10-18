import 'dart:developer';
import 'dart:io';

import 'package:drift/drift.dart';
// These imports are used to open the database
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:planning_system/core/database/tables.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';
import 'package:planning_system/core/utils/contants.dart';
import 'package:planning_system/core/utils/matiere.dart';

part 'db.g.dart';

@DriftDatabase(
  tables: [
    EnseignantsTable,
    GradesTable,
    MatiereTable,
    EnseignantMatiereTable,
    VoeuxTable,
    CreneauTable,
    ExamenTable,
    AffectionTable,
  ],
)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  // ============================================================================
  // Grades APIs
  // ============================================================================

  Future<void> updateGradeNbOfSeance({
    required int nb,
    required GradeEnum grade,
  }) async {
    await (update(gradesTable)..where((t) => t.codeGrade.equals(grade.name)))
        .write(GradesTableCompanion(nbOfSeance: Value(nb)));
  }

  Future<List<QueryRow>> getGradesStats() async {
    const sql = '''
    SELECT 
      g.code_grade AS codeGrade,
      COUNT(e.code_smartex_ens) AS totalEnseignants,
      SUM(CASE WHEN e.participe_surveillance = 1 THEN 1 ELSE 0 END) AS totalParticipants,
      g.nb_of_seance AS nbOfSeance
    FROM grades_table AS g
    LEFT JOIN enseignants_table AS e ON e.grade_code_ens = g.code_grade
    GROUP BY g.code_grade;
  ''';

    final result = await customSelect(
      sql,
      readsFrom: {gradesTable, enseignantsTable},
    ).get();
    log(result.toString());
    return result;
  }

  /// Reactive version of getGradesStats. Emits updates when grades or enseignants change.
  Stream<List<QueryRow>> watchGradesStats() {
    const sql = '''
    SELECT 
      g.code_grade AS codeGrade,
      COUNT(e.code_smartex_ens) AS totalEnseignants,
      SUM(CASE WHEN e.participe_surveillance = 1 THEN 1 ELSE 0 END) AS totalParticipants,
      g.nb_of_seance AS nbOfSeance
    FROM grades_table AS g
    LEFT JOIN enseignants_table AS e ON e.grade_code_ens = g.code_grade
    GROUP BY g.code_grade;
  ''';

    return customSelect(
      sql,
      readsFrom: {gradesTable, enseignantsTable},
    ).watch();
  }

  Future<void> insertGrades({required List<Grade> models}) async {
    await batch((batch) {
      batch.insertAll(
        enseignantsTable,
        models.map(
          (model) => GradesTableCompanion.insert(
            codeGrade: model.codeGrade,
            label: model.codeGrade.name,
            nbOfSeance: Value(model.nbOfSeance),
          ),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  // ============================================================================
  // Enseignants APIs (CRUD + Stream)
  // ============================================================================
  Future<List<Enseignant>> readAllEnseignant() async {
    return select(enseignantsTable).get();
  }

  // Reactive stream of all enseignants
  Stream<List<Enseignant>> watchAllEnseignant() {
    return select(enseignantsTable).watch();
  }

  Future<void> insertEnseignant({required Enseignant model}) async {
    await into(enseignantsTable).insertOnConflictUpdate(
      EnseignantsTableCompanion.insert(
        codeSmartexEns: model.codeSmartexEns,
        nomEns: model.nomEns,
        prenomEns: model.prenomEns,
        emailEns: model.emailEns,
        gradeCodeEns: model.gradeCodeEns,
        participeSurveillance: Value(model.participeSurveillance),
      ),
    );
  }

  Future<void> insertAllEnseignant({required List<Enseignant> models}) async {
    await batch((batch) {
      batch.insertAll(
        enseignantsTable,
        models.map(
          (model) => EnseignantsTableCompanion.insert(
            codeSmartexEns: model.codeSmartexEns,
            nomEns: model.nomEns,
            prenomEns: model.prenomEns,
            emailEns: model.emailEns,
            gradeCodeEns: model.gradeCodeEns,
            participeSurveillance: Value(model.participeSurveillance),
          ),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<void> deleteEnseignant({required String codeSmartexEns}) async {
    await (delete(
      enseignantsTable,
    )..where((t) => t.codeSmartexEns.equals(codeSmartexEns))).go();
  }

  // ============================================================================
  // Voeux APIs
  // ============================================================================
  Future<void> deleteVoeu({required int id}) async {
    await (delete(voeuxTable)..where((t) => t.id.equals(id))).go();
  }

  Future<void> insertAllVouex({
    required List<VoeuxTableCompanion> models,
  }) async {
    await batch((batch) {
      batch.insertAll(voeuxTable, models, mode: InsertMode.insertOrReplace);
    });
  }

  Future<List<Voeux>> readAllVoeux() async {
    return select(voeuxTable).get();
  }

  Future<List<QueryRow>> readAllVoeuxWithTeacherNames() async {
    const sql = '''
      SELECT 
        v.id AS id,
        v.code_smartex_ens AS codeSmartexEns,
        v.session AS session,
        v.semestre AS semestre,
        v.jour AS jour,
        v.seance AS seance,
        e.nom_ens AS nomEns,
        e.prenom_ens AS prenomEns
      FROM voeux_table AS v
      INNER JOIN enseignants_table AS e 
        ON e.code_smartex_ens = v.code_smartex_ens;
    ''';

    return customSelect(sql, readsFrom: {voeuxTable, enseignantsTable}).get();
  }

  /// Reactive join to stream voeux rows with enseignant names
  Stream<List<QueryRow>> watchAllVoeuxWithTeacherNames() {
    const sql = '''
      SELECT 
        v.id AS id,
        v.code_smartex_ens AS codeSmartexEns,
        v.session AS session,
        v.semestre AS semestre,
        v.jour AS jour,
        v.seance AS seance,
        e.nom_ens AS nomEns,
        e.prenom_ens AS prenomEns
      FROM voeux_table AS v
      INNER JOIN enseignants_table AS e 
        ON e.code_smartex_ens = v.code_smartex_ens;
    ''';

    return customSelect(sql, readsFrom: {voeuxTable, enseignantsTable}).watch();
  }

  @override
  int get schemaVersion => 1;

  @override
  // ============================================================================
  // Schema & Migration
  // ============================================================================
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll(); // creates every table



      // Seed grade lookup data once
      await batch((batch) {
        batch.insertAll(
          gradesTable,
          kgradesData.map(
            (grade) => GradesTableCompanion.insert(
              codeGrade: grade.codeGrade,
              label: grade.label,
              nbOfSeance: Value(grade.nbOfSeance),
            ),
          ),
          mode: InsertMode.insertOrReplace,
        );
      });

      // Seed matiere lookup data once
      await batch((batch) {
        batch.insertAll(
          matiereTable,
          kMatiereData.map(
            (m) => MatiereTableCompanion.insert(
              codeMatiere: m.codeMatiere,
              label: m.label,
            ),
          ),
          mode: InsertMode.insertOrReplace,
        );
      });
    },
    // Optional: handle upgrades here if schemaVersion increases later.
  );
}

// ============================================================================
// Connection initialization
// ============================================================================
LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}

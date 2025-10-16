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

  Future<List<QueryRow>> getGradesStats() async {
    const sql = '''
    SELECT 
      g.code_grade AS codeGrade,
      COUNT(e.code_smartex_ens) AS totalEnseignants,
      SUM(CASE WHEN e.participe_surveillance = 1 THEN 1 ELSE 0 END) AS totalParticipants,
      g.nb_heure AS nbHeure
    FROM grade AS g
    LEFT JOIN enseignant AS e ON e.grade_code_ens = g.code_grade
    GROUP BY g.code_grade;
  ''';

    final result = await customSelect(
      sql,
      readsFrom: {gradesTable, enseignantsTable},
    ).get();
    return result;
  }

  Future<void> insertGrades({required List<Grade> models}) async {
    await batch((batch) {
      batch.insertAll(
        enseignantsTable,
        models.map(
          (model) => GradesTableCompanion.insert(
            codeGrade: model.codeGrade,
            label: model.codeGrade.name,
            nbHeure: Value(model.nbHeure),
          ),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<List<Enseignant>> readAllEnseignant() async {
    return select(enseignantsTable).get();
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

  @override
  int get schemaVersion => 1;
}

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

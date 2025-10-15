import 'package:drift/drift.dart';


@DataClassName('Enseignant')
class EnseignantsTable extends Table {
  TextColumn get codeSmartexEns => text().named('code_smartex_ens')();
  TextColumn get nomEns => text().named('nom_ens')();
  TextColumn get prenomEns => text().named('prenom_ens')();
  TextColumn get emailEns => text().named('email_ens').unique()();
  TextColumn get gradeCodeEns => text()
      .named('grade_code_ens')
      .withDefault(const Constant('ex'))
      .references(GradesTable, #codeGrade)();
  BoolColumn get participeSurveillance => boolean()
      .named('participe_surveillance')
      .withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {codeSmartexEns};
}

@DataClassName('Grade')
class GradesTable extends Table {
  TextColumn get codeGrade => text().named('code_grade')();
  TextColumn get label => text()();
  IntColumn get nbHeure =>
      integer().named('nb_heure').withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {codeGrade};
}

@DataClassName('Matiere')
class MatiereTable extends Table {
  TextColumn get codeMatiere => text().named('code_matiere')();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {codeMatiere};
}

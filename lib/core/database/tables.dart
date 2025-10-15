import 'package:drift/drift.dart';

@DataClassName('Enseignant')
class EnseignantsTable extends Table {
  TextColumn get codeSmartexEns => text()();
  TextColumn get nomEns => text()();
  TextColumn get prenomEns => text()();
  TextColumn get emailEns => text().unique()();
  TextColumn get gradeCodeEns => text()
      .withDefault(const Constant('ex'))
      .references(GradesTable, #codeGrade)();
  BoolColumn get participeSurveillance =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {codeSmartexEns};
}

@DataClassName('Grade')
class GradesTable extends Table {
  TextColumn get codeGrade => text()();
  TextColumn get label => text()();
  IntColumn get nbHeure => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {codeGrade};
}

@DataClassName('Matiere')
class MatiereTable extends Table {
  TextColumn get codeMatiere => text()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {codeMatiere};
}

@DataClassName('Seance')
class Seances extends Table {
  TextColumn get codeSeance => text()();
  DateTimeColumn get tempsDebut => dateTime()();
  DateTimeColumn get tempsFin => dateTime()();

  @override
  Set<Column> get primaryKey => {codeSeance};
}

@DataClassName('Voeux')
class VoeuxEnseignants extends Table {
   IntColumn get id => integer().autoIncrement()();
  TextColumn get semestre => text()();
  TextColumn get session => text()();
  TextColumn get codeSmartexEns =>
      text().references(EnseignantsTable, #codeSmartexEns)();
  IntColumn get jour => integer()();
  TextColumn get seance => text().references(Seances, #codeSeance)();
}

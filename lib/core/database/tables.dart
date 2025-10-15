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

import 'package:drift/drift.dart';
import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/session.dart';

@DataClassName('Enseignant')
class EnseignantsTable extends Table {
  TextColumn get codeSmartexEns => text()();
  TextColumn get nomEns => text()();
  TextColumn get prenomEns => text()();
  TextColumn get emailEns => text().unique()();
  TextColumn get gradeCodeEns =>
      textEnum<GradeEnum>().references(GradesTable, #codeGrade)();
  BoolColumn get participeSurveillance =>
      boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {codeSmartexEns};
}

@DataClassName('Grade')
class GradesTable extends Table {
  TextColumn get codeGrade => textEnum<GradeEnum>()();
  TextColumn get label => text()();
  IntColumn get nbOfSeance => integer().withDefault(const Constant(0))();
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

@DataClassName('EnseignantMatiere')
class EnseignantMatiereTable extends Table {
  TextColumn get codeMatiere => text()();
  TextColumn get codeSmartexEns => text()();

  @override
  Set<Column> get primaryKey => {codeMatiere, codeSmartexEns};
}

@DataClassName('Voeux')
class VoeuxTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get semestre => textEnum<SemestreEnum>()();
  TextColumn get session => textEnum<SessionEnum>()();
  TextColumn get codeSmartexEns =>
      text().references(EnseignantsTable, #codeSmartexEns)();
  IntColumn get jour => integer()();
  TextColumn get seance => textEnum<SeanceEnum>()();
}

@DataClassName('Creneau')
class CreneauTable extends Table {
  IntColumn get codeCreneau => integer().autoIncrement()();
  IntColumn get nbSalle => integer()();
  TextColumn get seance => textEnum<SeanceEnum>()();
  DateTimeColumn get dateCreneau => dateTime()();
}

@DataClassName('Examen')
class ExamenTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get codeCreneau => integer()();
  TextColumn get codeMatiere => text()();
  TextColumn get classe => text()();
}

/// This is where to insert our final result : tik tak 7ot fi sak
@DataClassName('Affectation')
class AffectionTable extends Table {
  IntColumn get codeCreneau => integer()();
  TextColumn get codeSmartexEns => text()();
  TextColumn get semestre => textEnum<SemestreEnum>()();
  TextColumn get session => textEnum<SessionEnum>()();

  @override
  Set<Column<Object>>? get primaryKey => {codeCreneau, codeSmartexEns};
}

import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/interface/exporter_interface.dart';

class EnseignantExporter implements ExcelExporter<Enseignant> {
  @override
  List<String> get headers => [
    "nom_ens",
    "prenom_ens",
    "email_ens",
    "grade_code_ens",
    "code_smartex_ens",
    "participe_surveillance",
  ];

  @override
  List<dynamic> mapRow(Enseignant item) => [
    item.nomEns,
    item.prenomEns,
    item.emailEns,
    item.gradeCodeEns,
    item.codeSmartexEns,
    item.participeSurveillance,
  ];

  @override
  String get sheetName => "Sheet1";
}

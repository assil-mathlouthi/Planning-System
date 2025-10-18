import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:planning_system/core/database/db.dart';

class DataReader {
  static Future<List<EnseignantMatiere>> loadEnseignantMatiereFromAssets() async {
    final jsonString = await rootBundle.loadString(
      'assets/json/enseignant_matiere.json',
    );
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList
        .map(
          (e) => EnseignantMatiere(
            codeMatiere: e['matiere_id'],
            codeSmartexEns: e['code_smartex_ens'],
          ),
        )
        .toList();
  }

  static Future<List<Matiere>> loadMatiereFromAssets() async {
    final jsonString = await rootBundle.loadString('assets/json/matieres.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList
        .map((e) => Matiere(codeMatiere: e['ID'], label: e['Libelle']))
        .toList();
  }
}

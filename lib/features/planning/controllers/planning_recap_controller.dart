import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/enums/semestre.dart';
import 'package:planning_system/core/enums/seance.dart' as core_seance;
import 'package:planning_system/features/planning/model/chunk_model.dart';
import 'package:planning_system/features/planning/model/grid_item_model.dart';

class PlanningRecapController extends GetxController {
  final AppDb _db = Get.find();

  Future<List<ChunkModel>> getEnseignantAffectations({
    required String smartexCode,
  }) async {
    // 1) Read affectations for the enseignant
    final affQuery = _db.select(_db.affectionTable)
      ..where((a) => a.codeSmartexEns.equals(smartexCode));
    final affs = await affQuery.get();
    if (affs.isEmpty) return [];

    // 2) Fetch all concerned creneaux in a single query
    final codes = affs.map((a) => a.codeCreneau).toSet().toList();
    final crQuery = _db.select(_db.creneauTable)
      ..where((c) => c.codeCreneau.isIn(codes));
    final creneaux = await crQuery.get();

    // 3) Map to ChunkModel
    final chunks = creneaux
        .map((c) => ChunkModel(date: c.dateCreneau, seanceEnum: c.seance))
        .toList();

    // 4) Sort by date then seance order
    chunks.sort((a, b) {
      final d = a.date.compareTo(b.date);
      if (d != 0) return d;
      return _seanceOrder(a.seanceEnum).compareTo(_seanceOrder(b.seanceEnum));
    });

    return chunks;
  }

  int _seanceOrder(core_seance.SeanceEnum s) {
    switch (s) {
      case core_seance.SeanceEnum.s1:
        return 1;
      case core_seance.SeanceEnum.s2:
        return 2;
      case core_seance.SeanceEnum.s3:
        return 3;
      case core_seance.SeanceEnum.s4:
        return 4;
    }
  }

  // Stream of recap rows aggregated by creneau
  // Columns exposed to UI: Date, Séance, Session, Semestre, Nb Examens, Nb Surveillants, Nb Salles
  Stream<List<Map<String, dynamic>>> get recapStream {
    const sql = '''
      SELECT 
        c.date_creneau AS dateCreneau,
        c.seance AS seance,
        a.session AS session,
        a.semestre AS semestre,
        COUNT(DISTINCT x.id) AS nbExamens,
        COUNT(DISTINCT a.code_smartex_ens) AS nbSurveillants,
        c.nb_salle AS nbSalle
      FROM affection_table a
      INNER JOIN creneau_table c ON c.code_creneau = a.code_creneau
      LEFT JOIN examen_table x ON x.code_creneau = c.code_creneau
      GROUP BY c.date_creneau, c.seance, a.session, a.semestre, c.nb_salle
      ORDER BY c.date_creneau, c.seance;
    ''';

    return _db
        .customSelect(
          sql,
          readsFrom: {_db.creneauTable, _db.affectionTable, _db.examenTable},
        )
        .watch()
        .map(
          (rows) => rows.map((row) {
            return {
              'Date': row.read<DateTime>('dateCreneau'),
              'Séance': row.read<String>('seance'),
              'Session': row.read<String?>('session') ?? '',
              'Semestre': row.read<String?>('semestre') ?? '',
              'Nb Examens': row.read<int>('nbExamens'),
              'Nb Surveillants': row.read<int>('nbSurveillants'),
              'Nb Salles': row.read<int>('nbSalle'),
            };
          }).toList(),
        );
  }

  // Stream of GridItemModel for the planning grid, aggregated per enseignant and semestre
  Stream<List<GridItemModel>> get planningGridStream {
    const sql = '''
      SELECT 
        a.code_smartex_ens AS codeSmartex,
        e.nom_ens AS nom,
        e.prenom_ens AS prenom,
        a.semestre AS semestre,
        COUNT(*) AS nbrSurveillances
      FROM affection_table a
      INNER JOIN enseignants_table e ON e.code_smartex_ens = a.code_smartex_ens
      INNER JOIN creneau_table c ON c.code_creneau = a.code_creneau
      GROUP BY a.code_smartex_ens, e.nom_ens, e.prenom_ens, a.semestre
      ORDER BY e.nom_ens, e.prenom_ens;
    ''';

    return _db
        .customSelect(
          sql,
          readsFrom: {
            _db.affectionTable,
            _db.enseignantsTable,
            _db.creneauTable,
          },
        )
        .watch()
        .map(
          (rows) => rows.map((row) {
            final code = row.read<String>('codeSmartex');
            final nom = row.read<String>('nom');
            final prenom = row.read<String>('prenom');
            final semStr = row.read<String>('semestre');
            final count = row.read<int>('nbrSurveillances');
            return GridItemModel(
              codeSmartex: code,
              nom: nom,
              prenom: prenom,
              nbrSurveillances: count,
              semestre: SemestreEnum.parseSemestre(semStr),
            );
          }).toList(),
        );
  }
}

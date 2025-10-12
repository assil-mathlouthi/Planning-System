import 'package:planning_system/core/models/enums.dart';

class VoeuxEnseignant {
  Semestre semestre;
  Session session;
  String codeSmartexEns;
  int jour;
  Seance seance;

  VoeuxEnseignant({
    required this.semestre,
    required this.session,
    required this.codeSmartexEns,
    required this.jour,
    required this.seance,
  });

  VoeuxEnseignant copyWith({
    Semestre? semestre,
    Session? session,
    String? codeSmartexEns,
    int? jour,
    Seance? seance,
  }) {
    return VoeuxEnseignant(
      semestre: semestre ?? this.semestre,
      session: session ?? this.session,
      codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
      jour: jour ?? this.jour,
      seance: seance ?? this.seance,
    );
  }

  @override
  String toString() {
    return 'Enseignant $codeSmartexEns souhaite d`eviter la seance $seance, du jour $jour, du semestre $semestre, du session $session. ';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is VoeuxEnseignant &&
        other.semestre == semestre &&
        other.session == session &&
        other.codeSmartexEns == codeSmartexEns &&
        other.jour == jour &&
        other.seance == seance;
  }
}

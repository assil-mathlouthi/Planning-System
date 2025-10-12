import 'package:planning_system/core/models/enums.dart';

class GradeEnseignant {
  Grade gradeCode;
  String label;
  int nbHeure;
  GradeEnseignant({
    required this.gradeCode,
    required this.label,
    required this.nbHeure,
  });

  GradeEnseignant copyWith({Grade? gradeCode, String? label, int? nbHeure}) {
    return GradeEnseignant(
      gradeCode: gradeCode ?? this.gradeCode,
      label: label ?? this.label,
      nbHeure: nbHeure ?? this.nbHeure,
    );
  }

  @override
  String toString() {
    return 'Grade $gradeCode est nomme $label, et necessite $nbHeure de survillance';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GradeEnseignant &&
        other.gradeCode == gradeCode &&
        other.label == gradeCode &&
        other.nbHeure == nbHeure;
  }

  @override
  int get hashCode {
    return gradeCode.hashCode ^ label.hashCode;
  }
}

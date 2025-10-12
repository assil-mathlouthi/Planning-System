
import 'package:planning_system/core/enums/grade.dart';

class Enseignant {
  String codeSmartexEns;
  String nomEns;
  String prenomEns;
  String emailEns;
  Grade gradeCodeEns;
  bool participeSurveillance;
  Enseignant({
    required this.codeSmartexEns,
    required this.nomEns,
    required this.prenomEns,
    required this.emailEns,
    required this.gradeCodeEns,
    required this.participeSurveillance,
  });
  
  Enseignant copyWith({
    String? codeSmartexEns,
    String? nomEns,
    String? prenomEns,
    String? emailEns,
    Grade? gradeCodeEns,
    bool? participeSurveillance,
  }) {
    return Enseignant(
      codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
      nomEns: nomEns ?? this.nomEns,
      prenomEns: prenomEns ?? this.prenomEns,
      emailEns: emailEns ?? this.emailEns,
      gradeCodeEns: gradeCodeEns ?? this.gradeCodeEns,
      participeSurveillance:
          participeSurveillance ?? this.participeSurveillance,
    );
  }

  @override
  String toString() {
    return 'Enseignant (codeSmartexEns:$codeSmartexEns,nomEns:$nomEns ,prenomEns:$prenomEns,emailEns:$emailEns,gradeCodeEns:$gradeCodeEns,participeSurveillance:$participeSurveillance )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Enseignant &&
        other.codeSmartexEns == codeSmartexEns &&
        other.emailEns == emailEns;
  }

  @override
  int get hashCode {
    return codeSmartexEns.hashCode ^ emailEns.hashCode;
  }
}

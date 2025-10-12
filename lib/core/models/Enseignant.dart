import 'package:planning_system/core/models/enums.dart';

class Enseignant {
  String code_smartex_ens;
  String nom_ens;
  String prenom_ens;
  String email_ens;
  Grade grade_code_ens;
  bool participe_surveillance;
  Enseignant({
    required this.code_smartex_ens,
    required this.nom_ens,
    required this.prenom_ens,
    required this.email_ens,
    required this.grade_code_ens,
    required this.participe_surveillance,
  });
  Map<String, dynamic> toMap() {
    return {
      "code_smartex_ens": code_smartex_ens,
      "nom_ens": nom_ens,
      "prenom_ens": prenom_ens,
      "email_ens": email_ens,
      "grade_code_ens": grade_code_ens,
      "participe_surveillance": participe_surveillance,
    };
  }

  factory Enseignant.fromMap(Map<String, dynamic> map) {
    return Enseignant(
      code_smartex_ens: map['code_smartex_ens'],
      nom_ens: map['nom_ens'],
      prenom_ens: map['prenom_ens'],
      email_ens: map['email_ens'],
      grade_code_ens: map['grade_code_ens'],
      participe_surveillance: map['participe_surveillance'],
    );
  }
  Enseignant copyWith({
    String? code_smartex_ens,
    String? nom_ens,
    String? prenom_ens,
    String? email_ens,
    Grade? grade_code_ens,
    bool? participe_surveillance,
  }) {
    return Enseignant(
      code_smartex_ens: code_smartex_ens ?? this.code_smartex_ens,
      nom_ens: nom_ens ?? this.nom_ens,
      prenom_ens: prenom_ens ?? this.prenom_ens,
      email_ens: email_ens ?? this.email_ens,
      grade_code_ens: grade_code_ens ?? this.grade_code_ens,
      participe_surveillance:
          participe_surveillance ?? this.participe_surveillance,
    );
  }

  @override
  String toString() {
    return 'Enseignant (code_smartex_ens:$code_smartex_ens,nom_ens:$nom_ens ,prenom_ens:$prenom_ens,email_ens:$email_ens,grade_code_ens:$grade_code_ens,participe_surveillance:$participe_surveillance )';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Enseignant &&
        other.code_smartex_ens == code_smartex_ens &&
        other.email_ens == email_ens;
  }
  
}

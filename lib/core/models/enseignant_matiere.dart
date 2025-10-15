// class EnseignantMatiere {
//   String codeMatiere;
//   String codeSmartexEns;
//   EnseignantMatiere({required this.codeMatiere, required this.codeSmartexEns});
//   EnseignantMatiere copyWith({String? codeMatiere, String? codeSmartexEns}) {
//     return EnseignantMatiere(
//       codeMatiere: codeMatiere ?? this.codeMatiere,
//       codeSmartexEns: codeSmartexEns ?? this.codeSmartexEns,
//     );
//   }

//   @override
//   String toString() {
//     return 'Enseignant (codeSmartexEns: $codeSmartexEns, est affecté a la matiere $codeMatiere).';
//   }

//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     return other is EnseignantMatiere &&
//         other.codeMatiere == codeMatiere &&
//         other.codeSmartexEns == codeSmartexEns;
//   }

//   @override
//   // TODO: implement hashCode
//   int get hashCode {
//     return codeMatiere.hashCode ^ codeSmartexEns.hashCode;
//   }
// }

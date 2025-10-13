import 'package:excel/excel.dart';
import 'package:planning_system/core/enums/grade.dart';

class EnseignantModel {
  final String codeSmartexEns;
  final String nomEns;
  final String prenomEns;
  final String emailEns;
  final Grade gradeCodeEns;
  final bool participeSurveillance;

  EnseignantModel({
    required this.codeSmartexEns,
    required this.nomEns,
    required this.prenomEns,
    required this.emailEns,
    required this.gradeCodeEns,
    required this.participeSurveillance,
  });


  factory EnseignantModel.fromExcel(List<Data?> row) {
    String getCellValue(int index) {
      final cell = row[index]?.value;
      if (cell == null) throw Exception('Cell at index $index is empty');
      return cell.toString().trim();
    }

    // Parse grade string to enum, case-insensitive
    Grade parseGrade(String gradeStr) {
      final normalized = gradeStr.toLowerCase();
      return Grade.values.firstWhere(
        (g) => g.toString().split('.').last.toLowerCase() == normalized,
        orElse: () => throw Exception('Invalid grade: $gradeStr'),
      );
    }

    try {
      return EnseignantModel(
        codeSmartexEns: getCellValue(0),
        nomEns: getCellValue(1),
        prenomEns: getCellValue(2),
        emailEns: getCellValue(3),
        gradeCodeEns: parseGrade(getCellValue(4)),
        participeSurveillance: getCellValue(5).toLowerCase() == 'oui',
      );
    } catch (e) {
      throw Exception(
        'Failed to parse Excel row: $e\nRow data: ${row.map((cell) => cell?.value).toList()}',
      );
    }
  }

  EnseignantModel copyWith({
    String? codeSmartexEns,
    String? nomEns,
    String? prenomEns,
    String? emailEns,
    Grade? gradeCodeEns,
    bool? participeSurveillance,
  }) {
    return EnseignantModel(
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
    return other is EnseignantModel &&
        other.codeSmartexEns == codeSmartexEns &&
        other.emailEns == emailEns;
  }

  @override
  int get hashCode {
    return codeSmartexEns.hashCode ^ emailEns.hashCode;
  }
}

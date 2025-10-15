enum GradeEnum {
  pr,
  ma,
  v,
  ptc,
  va,
  ac,
  as,
  ex,
  pes,
  mc;

  static GradeEnum parseGrade(String gradeStr) {
    final normalized = gradeStr.toLowerCase();
    return GradeEnum.values.firstWhere(
      (g) => g.toString().split('.').last.toLowerCase() == normalized,
      orElse: () => throw Exception('Invalid grade: $gradeStr'),
    );
  }
}

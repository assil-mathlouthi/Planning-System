enum Grade {
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

  static Grade parseGrade(String gradeStr) {
    final normalized = gradeStr.toLowerCase();
    return Grade.values.firstWhere(
      (g) => g.toString().split('.').last.toLowerCase() == normalized,
      orElse: () => throw Exception('Invalid grade: $gradeStr'),
    );
  }
}

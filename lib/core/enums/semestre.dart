enum SemestreEnum {
  sem1,
  sem2;

  static SemestreEnum parseSemestre(String input) {
    final normalized = input.trim().toLowerCase();
    if (normalized.contains('sem1') || normalized == 'semestre 1') {
      return SemestreEnum.sem1;
    }
    if (normalized.contains('sem2') || normalized == 'semestre 2') {
      return SemestreEnum.sem2;
    }
    return SemestreEnum.sem2;
  }

  String get getText {
    switch (this) {
      case sem1:
        return "Semestre 1";
      case sem2:
        return "Semestre 2";
    }
  }
}

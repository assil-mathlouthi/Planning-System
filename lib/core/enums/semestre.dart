enum SemestreEnum {
  sem1,
  sem2;

  String get getText {
    switch (this) {
      case sem1:
        return "Semestre 1";
      case sem2:
        return "Semestre 2";
    }
  }
}

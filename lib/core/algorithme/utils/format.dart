import 'package:planning_system/core/enums/grade.dart';
import 'package:planning_system/core/enums/seance.dart';

import '../models/creanau.dart';

class Format {
  String formaterCreneau(CreneauComplet creneau) {
    return 'Jour ${creneau.jourSession} - ${formaterSeance(creneau.seance)}';
  }

  String formaterSeance(SeanceEnum seance) {
    return seance.toString().split('.').last.toUpperCase();
  }

  String formaterGrade(GradeEnum grade) {
    return grade.toString().split('.').last;
  }
}

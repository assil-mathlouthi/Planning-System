import 'package:planning_system/core/enums/grade.dart';

class GradeStatModel {
  final GradeEnum gradeEnum;
  final int total;
  final int participants;
  final double nbHours;

  GradeStatModel({
    required this.gradeEnum,
    required this.total,
    required this.participants,
    required this.nbHours,
  });
}

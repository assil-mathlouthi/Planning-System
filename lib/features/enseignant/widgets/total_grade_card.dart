import 'package:flutter/material.dart';
import 'package:planning_system/core/enums/grade.dart';

class TotalGradeCard extends StatelessWidget {
  const TotalGradeCard({
    super.key,
    required this.total,
    required this.gradeEnum,
  });

  final int total;
  final GradeEnum gradeEnum;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

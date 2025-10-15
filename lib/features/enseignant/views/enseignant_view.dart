import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/features/enseignant/widgets/eneigant_header.dart';
import 'package:planning_system/features/enseignant/widgets/grade_statistics.dart';

class EnseignantView extends StatelessWidget {
  const EnseignantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colors.surface,
      padding: EdgeInsetsGeometry.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [EneigantHeader(), 24.h, GradeStatistics()],
      ),
    );
  }
}

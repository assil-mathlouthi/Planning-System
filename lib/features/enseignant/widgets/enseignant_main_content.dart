import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/enseignant/widgets/enseignant_table.dart';

class EnseignantMainContent extends StatelessWidget {
  const EnseignantMainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.onPrimary,
        border: Border.all(color: context.colors.tertiary, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.all(24),
      child: EnseignantTable(),
    );
  }
}

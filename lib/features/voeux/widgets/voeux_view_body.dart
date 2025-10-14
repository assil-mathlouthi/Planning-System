import 'package:flutter/material.dart';
import 'package:planning_system/core/common/important_widget.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/features/voeux/widgets/voeux_header.dart';

import 'package:planning_system/features/voeux/widgets/voeux_table.dart';

class VoeuxViewBody extends StatelessWidget {
  const VoeuxViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colors.surface,
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            VoeuxHeader(),
            20.h,
            ImportantWidget(
              subTitle:
                  "Importez les souhaits de surveillance des enseignants depuis un fichier Excel. Le fichier doit contenir : nom, prénom, session, semestre, niveau et séance.",
            ),
            20.h,
            VoeuxTable(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/planning/widgets/planning_grid_cell.dart';

class PlanningGrid extends StatelessWidget {
  const PlanningGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Récapitulatif par seance",
              style: AppStyles.style16Meduim(
                context,
              ).copyWith(color: context.colors.secondary),
            ),
            PrimaryButton(
              icon: Assets.iconsUser,
              text: "Voir Planning Enseignant",
              onpressed: () {},
            ),
          ],
        ),
        30.h,
        Expanded(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            crossAxisSpacing: 18,
            children: List.generate(3, (index) {
              return SizedBox(
                height: 150, // Fixed height
                child: Column(
                  children: [
                    PlanningGridCell(
                      nomEnseignant: "nomEnseignant",
                      nbrSurveillances: 5,
                      date: "14/04/2004",
                      seance: SeanceEnum.s1,
                    ),
                    18.h,
                    PlanningGridCell(
                      nomEnseignant: "nomEnseignant",
                      nbrSurveillances: 5,
                      date: "14/04/2004",
                      seance: SeanceEnum.s1,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

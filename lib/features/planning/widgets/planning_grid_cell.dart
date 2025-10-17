import 'package:flutter/material.dart';
import 'package:planning_system/core/common/enum_content.dart';
import 'package:planning_system/core/enums/seance.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/planning/widgets/grid_export_button.dart';

class PlanningGridCell extends StatelessWidget {
  const PlanningGridCell({
    super.key,
    required this.nomEnseignant,
    required this.nbrSurveillances,
    required this.date,
    required this.seance,
  });
  final String nomEnseignant;
  final int nbrSurveillances;
  final String date;
  final SeanceEnum seance;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: context.colors.tertiary, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nomEnseignant,
                style: AppStyles.style14Regular(
                  context,
                ).copyWith(color: context.colors.secondary),
              ),
              Text(
                "$nbrSurveillances surveillances",
                style: AppStyles.style14Regular(context),
              ),
            ],
          ),
          12.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date, style: AppStyles.style14Regular(context)),
              EnumContent(enumValue: SeanceEnum.s1),
            ],
          ),
          12.h,
          GridExportButton(onpressed: () {}),
        ],
      ),
    );
  }
}

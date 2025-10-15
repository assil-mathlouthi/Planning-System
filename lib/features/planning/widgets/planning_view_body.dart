import 'package:flutter/material.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/planning/widgets/planning_button_list.dart';
import 'package:planning_system/features/planning/widgets/planning_card_list.dart';
import 'package:planning_system/features/planning/widgets/planning_recap.dart';

class PlanningViewBody extends StatelessWidget {
  const PlanningViewBody({super.key});
  //TODO: handle onpressed function
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Planning du surveillance",
                    style: AppStyles.style24Regular(
                      context,
                    ).copyWith(color: context.colors.secondary),
                  ),
                  Text(
                    "Consulter et exporter le planning final",
                    style: AppStyles.style16Regular(
                      context,
                    ).copyWith(color: context.colors.onSurface),
                  ),
                ],
              ),
              Row(
                children: [
                  PrimaryButton(
                    icon: Assets.iconsPdf,
                    text: "Export PDF",
                    onpressed: () {},
                  ),
                  PrimaryButton(
                    icon: Assets.iconsExcel,
                    text: "Export Excel",
                    onpressed: () {},
                  ),
                ],
              ),
            ],
          ),

          24.h,

          PlanningButtonList(),
          24.h,
          PlanningRecap(),
          24.h,
          PlanningCardList(),
        ],
      ),
    );
  }
}

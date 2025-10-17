import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/custom_search_field.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/controller/table_controller.dart';
import 'package:planning_system/features/voeux/widgets/voeux_table_liste.dart';

class VoeuxMainContainer extends StatelessWidget {
  const VoeuxMainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TableController(), tag: "Voeux");
    return Container(
      decoration: BoxDecoration(
        color: context.colors.onPrimary,
        border: Border.all(color: context.colors.tertiary, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VoeuxContainerHeader(),
          16.h,
          CustomSearchField(item: "voeu"),
          16.h,
          VoeuxTableListe(),
        ],
      ),
    );
  }
}

class VoeuxContainerHeader extends StatelessWidget {
  const VoeuxContainerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          style: AppStyles.style16Regular(
            context,
          ).copyWith(color: context.colors.secondary),
          "Liste des voeux importés",
        ),
        Text(
          style: AppStyles.style16Regular(
            context,
          ).copyWith(color: context.colors.secondary),
          "Total: 50",
        ),
      ],
    );
  }
}

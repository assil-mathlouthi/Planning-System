import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/voeux/controllers/voeux_controller.dart';

class VoeuxContainerHeader extends GetView<VoeuxController> {
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
        StreamBuilder<int>(
          stream: controller.voeuxCountStream,
          builder: (context, snapshot) {
            final total = snapshot.data ?? 0;
            return Text(
              "Total: $total",
              style: AppStyles.style16Regular(
                context,
              ).copyWith(color: context.colors.secondary),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: context.colors.error.withValues(
          alpha: 0.5,
        ), // Color of the ripple
        highlightColor: context.colors.onPrimaryContainer.withValues(
          alpha: 0.2,
        ), // Highlight color on press
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              SvgPicture.asset(Assets.iconsLogout),
              12.w,
              Text(
                "Déconnexion",
                style: AppStyles.style16Regular(
                  context,
                ).copyWith(color: context.colors.error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

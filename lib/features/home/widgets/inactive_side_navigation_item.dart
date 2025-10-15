import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/home/models/side_navigation_item_model.dart';

import 'package:planning_system/core/extensions/gap_with_sized_box.dart';

class InactiveSideNavigationItem extends StatelessWidget {
  const InactiveSideNavigationItem({super.key, required this.model});
  final SideNavigationItemModel model;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Row(
          children: [
            SvgPicture.asset(
              model.icon,
              height: 20,
              colorFilter: ColorFilter.mode(
                context.colors.secondary,
                BlendMode.srcIn,
              ),
            ),
            12.w,
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(model.text, style: AppStyles.style18Regular(context)),
            ),
          ],
        ),
      ),
    );
  }
}

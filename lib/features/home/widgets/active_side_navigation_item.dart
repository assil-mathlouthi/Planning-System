import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/home/models/side_navigation_item_model.dart';

import 'package:planning_system/core/extensions/gap_with_sized_box.dart';

class ActiveSideNavigationItem extends StatelessWidget {
  const ActiveSideNavigationItem({super.key, required this.model});

  final SideNavigationItemModel model;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: _buildDecoration(context),
        child: Row(
          children: [
            SvgPicture.asset(
              model.icon,
              height: 20,
              colorFilter: ColorFilter.mode(
                context.colors.onPrimary,
                BlendMode.srcIn,
              ),
            ),
            12.w,
            Text(
              model.text,
              style: AppStyles.style18Medium(
                context,
              ).copyWith(color: context.colors.onPrimary),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.colors.primary,
      borderRadius: BorderRadius.circular(8),
    );
  }
}

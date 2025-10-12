import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/home/models/side_navigation_item_model.dart';

class ActiveSideNavigationItem extends StatelessWidget {
  const ActiveSideNavigationItem({super.key, required this.model});

  final SideNavigationItemModel model;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: model.isActive ? context.colors.primary : null,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SvgPicture.asset(model.icon),
            const SizedBox(width: 12),
            Text(
              model.text,
              style: AppStyles.style18Medium(context).copyWith(
                color: model.isActive ? context.colors.onPrimary : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

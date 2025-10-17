import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/common/custom_table.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/assets.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key, required this.widget});

  final GenerateTable widget;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (widget.hasDownloadButton)
            IconButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              alignment: Alignment.centerLeft,
              icon: SvgPicture.asset(
                colorFilter: ColorFilter.mode(
                  context.colors.secondary,
                  BlendMode.srcIn,
                ),
                Assets.iconsDownload,
                width: 16,
                height: 16,
              ),
            ),

          IconButton(
            onPressed: () {},
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            alignment: Alignment.centerLeft,
            icon: SvgPicture.asset(Assets.iconsTrash, width: 16, height: 16),
          ),
          // IconButton(
          //   onPressed: () {},
          //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
          //   alignment: Alignment.centerLeft,
          //   icon: SvgPicture.asset(
          //     colorFilter: ColorFilter.mode(
          //       context.colors.secondary,
          //       BlendMode.srcIn,
          //     ),
          //     Assets.iconsEdit,
          //     width: 16,
          //     height: 16,
          //   ),
          // ),
        ],
      ),
    );
  }
}

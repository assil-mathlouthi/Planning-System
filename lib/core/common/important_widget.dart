import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

class ImportantWidget extends StatelessWidget {
  const ImportantWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.primaryContainer,
        border: Border.all(color: context.colors.primary),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.iconsInfo),
          13.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppStyles.style14Regular(
                    context,
                  ).copyWith(color: context.colors.primary),
                ),
                2.h,
                Text(subTitle, style: AppStyles.style14Regular(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

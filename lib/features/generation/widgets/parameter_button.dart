import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';

class ParameterButton extends StatelessWidget {
  const ParameterButton({
    super.key,
    required this.icon,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.onTap,
  });

  final String icon;
  final String text;
  final Color bgColor, textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(6),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
              width: 16,
              height: 16,
            ),
            14.w,
            Text(
              text,
              style: AppStyles.style14Regular(
                context,
              ).copyWith(color: textColor),
            ),
            24.h,
          ],
        ),
      ),
    );
  }
}

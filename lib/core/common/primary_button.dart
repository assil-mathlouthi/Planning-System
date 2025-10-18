import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onpressed,
    this.isActive = false,
  });

  final String icon;
  final String text;
  final bool isActive;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      borderRadius: BorderRadius.circular(8),
      hoverColor: context.colors.onPrimaryContainer,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        decoration: _buildDecoration(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              height: 18,
              colorFilter: ColorFilter.mode(
                isActive ? context.colors.onPrimary : context.colors.secondary,
                BlendMode.srcIn,
              ),
            ),
            10.w,
            Text(
              text,
              style: AppStyles.style18Medium(
                context,
              ).copyWith(color: isActive ? context.colors.onPrimary : null),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: isActive ? context.colors.primary : context.colors.onPrimary,
      border: Border.all(color: context.colors.onPrimaryContainer),
    );
  }
}

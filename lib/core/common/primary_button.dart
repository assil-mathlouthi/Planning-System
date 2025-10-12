import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
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
          children: [
            SvgPicture.asset(
              icon,
              height: 18,
              colorFilter: ColorFilter.mode(
                context.colors.secondary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 10),
            Text(text, style: AppStyles.style18Medium(context)),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: context.colors.onPrimaryContainer),
    );
  }
}

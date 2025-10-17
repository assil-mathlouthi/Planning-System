import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    required this.onPressed,
    this.hasBorder = false,
  });

  final String text;
  final Color bgColor, textColor;
  final VoidCallback onPressed;
  final bool hasBorder;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 17, vertical: 7),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(6),
          side: hasBorder
              ? BorderSide(color: context.colors.tertiary)
              : BorderSide(color: Colors.transparent),
        ),
      ),
      child: Text(
        text,
        style: AppStyles.style14Regular(context).copyWith(color: textColor),
      ),
    );
  }
}

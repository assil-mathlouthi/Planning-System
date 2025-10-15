import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class SecondaryButton extends StatelessWidget {
  //TODO: kifeh yetbadl el isActive waktili onclick wo
  //tetna7a ki click ala button ekher
  final String text;
  final void Function()? onpressed;
  final bool isActive;
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onpressed,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      borderRadius: BorderRadius.all(Radius.circular(12)),

      child: Container(
        width: 147,
        decoration: _buildDecoration(context),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Center(
          child: Text(
            text,
            style: AppStyles.style16Regular(
              context,
            ).copyWith(color: context.colors.secondary),
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: isActive ? context.colors.onPrimary : null,
    );
  }
}

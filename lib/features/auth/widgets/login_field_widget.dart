import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';

class LoginFieldWidget extends StatelessWidget {
  const LoginFieldWidget({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
    this.validator,
    required this.textEditingController,
  });

  final String label;
  final String hint;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: AppStyles.style14Regular(
            context,
          ).copyWith(color: context.colors.secondary),
        ),
        8.h,
        TextFormField(
          obscureText: isPassword,
          validator: validator,
          controller: textEditingController,
          style: AppStyles.style14Regular(
            context,
          ).copyWith(color: context.colors.secondary),
          decoration: InputDecoration(
            fillColor: context.colors.tertiaryContainer,
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            filled: true,
            hintText: hint,
            hintStyle: AppStyles.style14Regular(context),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

class RechercherInput extends StatelessWidget {
  const RechercherInput({super.key, required this.item});
  final String item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TextField(
        style: AppStyles.style14Regular(
          context,
        ).copyWith(color: context.colors.secondary),
        decoration: InputDecoration(
          fillColor: context.colors.tertiaryContainer,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          filled: true,
          hintText: "Rechercher un $item",
          hintStyle: AppStyles.style14Regular(context),
          prefixIcon: SvgPicture.asset(
            Assets.iconsSearch,
            fit: BoxFit.scaleDown,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

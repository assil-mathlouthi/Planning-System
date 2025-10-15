import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class RechercherInput extends StatelessWidget {
  const RechercherInput({super.key, required this.item});
  final String item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),

          fillColor: context.colors.tertiary,
          filled: true,
          hintText: "Rechercher un $item",
          hintStyle: AppStyles.style16Regular(context),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            // Add border for better visual
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

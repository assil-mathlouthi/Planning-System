import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';

class SecondaryGenerationViewContainer extends StatelessWidget {
  const SecondaryGenerationViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _decoration(context),
      padding: EdgeInsets.all(24),
      child: Column(
        children: [],
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      color: context.colors.onPrimary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: context.colors.tertiary),
      
    );
  }
}

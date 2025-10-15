import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/voeux/widgets/voeux_view_body.dart';

class VoeuxView extends StatelessWidget {
  const VoeuxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VoeuxViewBody(),
      backgroundColor: context.colors.surface,
    );
  }
}

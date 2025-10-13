import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/features/generation/widgets/generation_view_body.dart';

class GenerationView extends StatelessWidget {
  const GenerationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GenerationViewBody(),
      backgroundColor: context.colors.surface,
    );
  }
}

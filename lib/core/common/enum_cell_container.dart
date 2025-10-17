import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/contants.dart';

class EnumCellContainer extends StatelessWidget {
  const EnumCellContainer({
    super.key,
    required this.text,
    required this.colorPair,
  });
  final String text;
  final ColorPair colorPair;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentGeometry.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: colorPair.light,
          border: Border.all(color: context.colors.tertiary),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: AppStyles.style12Regular(
            context,
          ).copyWith(color: colorPair.dark),
        ),
      ),
    );
  }
}

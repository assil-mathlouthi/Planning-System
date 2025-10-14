import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    super.key,
    required this.sentence,
    this.title = '',
    required this.icon,
  });
  final String sentence;
  final String title;
  final String icon;
  @override
  Widget build(BuildContext context) {
    var item = Text(
      textAlign: TextAlign.start,
      title,
      style: AppStyles.style18Medium(
        context,
      ).copyWith(color: context.colors.onPrimary),
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (title.isNotEmpty) // Better than ternary
          item,
        SvgPicture.asset(icon, height: 16),
        SizedBox(width: 12),
        Flexible(fit: FlexFit.loose, child: Text(sentence)),
      ],
    );
  }
}

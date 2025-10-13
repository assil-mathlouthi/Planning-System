import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
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
    var item = Text(title, style: AppStyles.style18Medium(context));
    return Row(
      children: [
        title == '' ? SizedBox.shrink() : item,
        SvgPicture.asset(icon, height: 16),
        SizedBox(width: 12),
        Expanded(child: Text(sentence)),
      ],
    );
  }
}

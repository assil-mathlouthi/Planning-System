// date_content.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

class DateContent extends StatelessWidget {
  final DateTime date;
  final bool showTime;
  final String format;

  const DateContent({
    super.key,
    required this.date,
    this.showTime = false,
    this.format = 'dd/MM/yyyy',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          SvgPicture.asset(Assets.iconsDate),
          8.w,
          Text(
            _formatDate(date),
            style: AppStyles.style16Regular(
              context,
            ).copyWith(color: context.colors.secondary),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    if (showTime) {
      return '${_formatDay(date.day)}/${_formatDay(date.month)}/${date.year} ${_formatDay(date.hour)}:${_formatDay(date.minute)}';
    }

    return switch (format) {
      'dd/MM/yyyy' =>
        '${_formatDay(date.day)}/${_formatDay(date.month)}/${date.year}',
      'MM/dd/yyyy' =>
        '${_formatDay(date.month)}/${_formatDay(date.day)}/${date.year}',
      'yyyy-MM-dd' =>
        '${date.year}-${_formatDay(date.month)}-${_formatDay(date.day)}',
      _ => '${_formatDay(date.day)}/${_formatDay(date.month)}/${date.year}',
    };
  }

  String _formatDay(int value) => value.toString().padLeft(2, '0');
}

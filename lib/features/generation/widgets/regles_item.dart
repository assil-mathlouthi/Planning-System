import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

class ReglesItem extends StatelessWidget {
  final String title;
  final String details;
  const ReglesItem({super.key, required this.details, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.iconsCheck, height: 20),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(style: AppStyles.style18Regular(context), title),
            Text(style: AppStyles.style16Regular(context), details),
          ],
        ),
      ],
    );
  }
}

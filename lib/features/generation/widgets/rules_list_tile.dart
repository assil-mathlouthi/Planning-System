import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

class RulesListTile extends StatelessWidget {
  const RulesListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
  final String title, subTitle, icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      dense: true,
      horizontalTitleGap: 6,
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      title: Text(
        title,
        style: AppStyles.style16Regular(
          context,
        ).copyWith(color: context.colors.secondary),
      ),
      subtitle: Text(title, style: AppStyles.style14Regular(context)),
      leading: SvgPicture.asset(Assets.iconsRule),
    );
  }
}

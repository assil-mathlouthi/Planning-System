import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.colors.primary,
      ),
      child: Center(
        child: Text(
          userName[0].toUpperCase(),
          style: AppStyles.style16Regular(
            context,
          ).copyWith(color: context.colors.onPrimary),
        ),
      ),
    );
  }
}

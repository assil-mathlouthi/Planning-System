import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/home/widgets/user_avatar.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key, required this.userName, required this.email});

  final String userName;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          UserAvatar(userName: userName),
          12.w,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "$userName\n",
                  style: AppStyles.style16Regular(
                    context,
                  ).copyWith(color: context.colors.secondary),
                ),
                TextSpan(
                  text: email,
                  style: AppStyles.style16Regular(
                    context,
                  ).copyWith(color: context.colors.onSurface),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

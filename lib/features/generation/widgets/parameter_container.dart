import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/generation/widgets/parameter_button.dart';

class ParameterContainer extends StatelessWidget {
  const ParameterContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.importTap,
  });

  final String title, subtitle;
  final VoidCallback importTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: context.colors.secondaryContainer,
        border: Border.all(
          color: context.colors.onSecondaryContainer,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.style16Regular(
                  context,
                ).copyWith(color: context.colors.secondary),
              ),
              2.h,
              Text(subtitle, style: AppStyles.style14Regular(context)),
            ],
          ),
          Spacer(),
          ParameterButton(
            icon: Assets.iconsUpload,
            text: "Importer",
            bgColor: context.colors.primary,
            textColor: context.colors.onPrimary,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

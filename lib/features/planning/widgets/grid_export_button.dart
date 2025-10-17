import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';

class GridExportButton extends StatelessWidget {
  const GridExportButton({super.key, required this.onpressed});

  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      borderRadius: BorderRadius.circular(8),
      hoverColor: context.colors.onPrimaryContainer,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),

        decoration: _buildDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              Assets.iconsDownload,
              height: 18,
              colorFilter: ColorFilter.mode(
                context.colors.secondary,
                BlendMode.srcIn,
              ),
            ),
            10.w,
            Text(
              "Exporter",

              style: AppStyles.style14Medium(
                context,
              ).copyWith(color: context.colors.secondary),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: context.colors.surface,
      border: Border.all(color: context.colors.tertiary),
    );
  }
}

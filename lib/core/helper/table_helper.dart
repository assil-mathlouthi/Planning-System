import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/contants.dart';

class TableHelper {
  static TableRow generateHeader(
    BuildContext context,
    List<String> columnNames,
  ) {
    return TableRow(
      decoration: BoxDecoration(color: context.colors.primary),
      children: [
        ...columnNames.map(
          (element) => TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            // TableCell must be the immediate child of TableRow.
            child: Padding(
              padding: const EdgeInsets.all(kCellPadding),
              child: Text(
                element,
                style: AppStyles.style16Regular(
                  context,
                ).copyWith(color: context.colors.onPrimary),
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(kCellPadding),
            child: Text(
              "Actions",
              style: AppStyles.style16Regular(
                context,
              ).copyWith(color: context.colors.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}

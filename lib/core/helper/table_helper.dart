import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

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
            // TableCell must be the immediate child of TableRow.
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                element,
                style: AppStyles.style14Regular(
                  context,
                ).copyWith(color: context.colors.onPrimary),
              ),
            ),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Actions",
              style: AppStyles.style14Regular(
                context,
              ).copyWith(color: context.colors.onPrimary),
            ),
          ),
        ),
      ],
    );
  }
}

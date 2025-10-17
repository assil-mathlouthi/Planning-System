import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/action_buttons.dart';
import 'package:planning_system/core/common/cell_content.dart';
import 'package:planning_system/core/common/pagination_widget.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/helper/table_helper.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/voeux/controller/table_controller.dart';

class GenerateTable extends StatelessWidget {
  final List<Map<String, dynamic>> instanceList;
  final bool hasDownloadButton;
  final String tag;

  const GenerateTable({
    super.key,
    required this.instanceList,
    this.hasDownloadButton = false,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    final tableController = Get.find<TableController>(tag: tag);
    if (instanceList.isNotEmpty) {
      tableController.setData(instanceList);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Obx(() {
        final totalPages = tableController.totalPages;
        final currentPage = tableController.currentPage.value;
        final rows = tableController.currentRows;
        final keys = instanceList.isNotEmpty
            ? instanceList[0].keys.toList()
            : <String>[];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Récapitulatif par séance",
              style: AppStyles.style16Meduim(
                context,
              ).copyWith(color: context.colors.secondary),
            ),
            30.h,
            Table(
              border: _buildBorder(context),
              children: [
                TableHelper.generateHeader(context, keys),
                for (final entry in rows.asMap().entries)
                  TableRow(
                    decoration: BoxDecoration(
                      color: tableController.isRowHovered(entry.key)
                          ? const Color(0xffEBF8FF)
                          : const Color(0xffFFFFFF),
                    ),
                    children: [
                      for (final data in entry.value.values)
                        _buildTableCell(tableController, entry.key, data),
                      TableCell(
                        child: MouseRegion(
                          onEnter: (_) =>
                              tableController.setHoveredRow(entry.key),
                          onExit: (_) => tableController.setHoveredRow(-1),
                          child: ActionButtons(widget: this),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            12.h,
            // Pagination
            PaginationWidget(
              currentPage: currentPage,
              tableController: tableController,
              totalPages: totalPages,
            ),
          ],
        );
      }),
    );
  }

  TableCell _buildTableCell(TableController tableController, int index, data) {
    return TableCell(
      verticalAlignment: TableCellVerticalAlignment.middle,
      child: MouseRegion(
        onEnter: (_) => tableController.setHoveredRow(index),
        onExit: (_) => tableController.setHoveredRow(-1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: CellContent(content: data),
        ),
      ),
    );
  }

  TableBorder _buildBorder(BuildContext context) {
    return TableBorder(
      horizontalInside: BorderSide(color: context.colors.tertiary),
      right: BorderSide(color: context.colors.tertiary),
      left: BorderSide(color: context.colors.tertiary),
      bottom: BorderSide(color: context.colors.tertiary),
    );
  }
}

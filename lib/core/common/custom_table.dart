import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/action_buttons.dart';
import 'package:planning_system/core/common/cell_content.dart';
import 'package:planning_system/core/common/pagination_widget.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/helper/table_helper.dart';
import 'package:planning_system/core/controller/table_controller.dart';

class GenerateTable extends StatelessWidget {
  final List<Map<String, dynamic>> instanceList;
  final bool hasDownloadButton;
  final String tag;
  final void Function(Map<String, dynamic> row)? onDelete;

  const GenerateTable({
    super.key,
    required this.instanceList,
    this.hasDownloadButton = false,
    required this.tag,
    this.onDelete,
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
            ? instanceList[0].keys.where((k) => !k.startsWith('_')).toList()
            : <String>[];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                      for (final key in keys)
                        _buildTableCell(
                          tableController,
                          entry.key,
                          entry.value[key],
                        ),
                      TableCell(
                        child: MouseRegion(
                          onEnter: (_) =>
                              tableController.setHoveredRow(entry.key),
                          onExit: (_) => tableController.setHoveredRow(-1),
                          child: ActionButtons(
                            widget: this,
                            onDelete: onDelete == null
                                ? null
                                : () => onDelete!(entry.value),
                          ),
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

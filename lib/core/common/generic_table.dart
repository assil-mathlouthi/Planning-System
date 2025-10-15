import 'package:flutter/material.dart';
import 'package:planning_system/core/common/action_buttons.dart';
import 'package:planning_system/core/common/cell_content.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/helper/table_helper.dart';

class GenerateTable extends StatefulWidget {
  final List<Map<String, dynamic>> instanceList;
  final bool hasDownloadButton;

  const GenerateTable({
    super.key,
    required this.instanceList,
    this.hasDownloadButton = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GenerateTableState createState() => _GenerateTableState();
}

class _GenerateTableState extends State<GenerateTable> {
  final List<String> keys = [];
  int? _hoveredRowIndex;

  void initKeys() {
    keys.clear();
    for (var key in widget.instanceList[0].keys) {
      keys.add(key);
    }
  }

  @override
  Widget build(BuildContext context) {
    initKeys();

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Table(
        border: TableBorder(
          horizontalInside: BorderSide(color: context.colors.tertiary),
          right: BorderSide(color: context.colors.tertiary),
          left: BorderSide(color: context.colors.tertiary),
          bottom: BorderSide(color: context.colors.tertiary),
        ),
        children: [
          // Header row
          TableHelper.generateHeader(context, keys),

          // Data rows
          ...List.generate(widget.instanceList.length, (index) {
            final element = widget.instanceList[index];
            final isHovered = _hoveredRowIndex == index;

            return TableRow(
              decoration: BoxDecoration(
                color: isHovered ? Color(0xffF9FAFB) : Color(0xffFDFEFF),
              ),
              children: [
                ...element.values.map((data) {
                  return TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: MouseRegion(
                      onEnter: (_) => setState(() => _hoveredRowIndex = index),
                      onExit: (_) => setState(() => _hoveredRowIndex = null),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 12,
                        ),
                        child: CellContent(content: data),
                      ),
                    ),
                  );
                }),
                TableCell(
                  child: ActionButtons(widget: widget),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}


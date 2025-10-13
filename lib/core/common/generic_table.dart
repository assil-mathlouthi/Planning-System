import 'package:flutter/material.dart';
import 'package:planning_system/core/common/cell_content.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class GenerateTable extends StatelessWidget {
  final List<Map<String, dynamic>> instanceList;
  final bool showActions;
  final Function(Map<String, dynamic>)? onEdit;
  final Function(Map<String, dynamic>)? onDelete;

  const GenerateTable({
    super.key,
    required this.instanceList,
    this.showActions = false,
    this.onEdit,
    this.onDelete,
  });

  List<DataColumn> _buildDataColumns(BuildContext context) {
    if (instanceList.isEmpty) return [];

    return instanceList[0].keys.map((key) {
      return DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            _capitalize(key),
            style: AppStyles.style18Regular(
              context,
            ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();
  }

  List<DataRow> _buildDataRows(BuildContext context) {
    return instanceList.asMap().entries.map((entry) {
      final index = entry.key;
      final instance = entry.value;

      return DataRow(
        color: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          // Zebra striping
          if (index % 2 == 0) {
            return context.colors.onPrimary.withValues(alpha: 0.1);
          } else {
            return context.colors.surface;
          }
        }),
        cells: instance.keys.map((key) {
          return DataCell(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CellContent(content: instance[key]),
            ),
          );
        }).toList(),
      );
    }).toList();
  }

  List<DataColumn> _buildDataColumnsWithActions(BuildContext context) {
    if (instanceList.isEmpty) return [];

    final columns = instanceList[0].keys.map((key) {
      return DataColumn(
        label: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            _capitalize(key),
            style: AppStyles.style18Regular(
              context,
            ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }).toList();

    if (showActions) {
      columns.add(
        DataColumn(
          label: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Actions',
              style: AppStyles.style18Regular(
                context,
              ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      );
    }

    return columns;
  }

  List<DataRow> _buildDataRowsWithActions(BuildContext context) {
    return instanceList.asMap().entries.map((entry) {
      final index = entry.key;
      final instance = entry.value;

      final cells = instance.keys.map((key) {
        return DataCell(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CellContent(content: instance[key]),
          ),
        );
      }).toList();

      if (showActions) {
        cells.add(
          DataCell(
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (onEdit != null)
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue, size: 20),
                    onPressed: () => onEdit!(instance),
                  ),
                if (onDelete != null)
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red, size: 20),
                    onPressed: () => onDelete!(instance),
                  ),
              ],
            ),
          ),
        );
      }

      return DataRow(
        color: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (index % 2 == 0) {
            return context.colors.onPrimary.withValues(alpha: 0.1);
          } else {
            return context.colors.surface;
          }
        }),
        cells: cells,
      );
    }).toList();
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    if (instanceList.isEmpty) {
      return Center(
        child: Text(
          'No data available',
          style: AppStyles.style16Regular(context),
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: DataTable(
          headingRowColor: WidgetStateProperty.all<Color>(
            context.colors.primary,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          columns: showActions
              ? _buildDataColumnsWithActions(context)
              : _buildDataColumns(context),
          rows: showActions
              ? _buildDataRowsWithActions(context)
              : _buildDataRows(context),
          dataRowMaxHeight: 60,
          headingRowHeight: 60,
          horizontalMargin: 0,
          columnSpacing: 0,
          dividerThickness: 1,
          border: TableBorder(
            horizontalInside: BorderSide(color: Colors.grey.shade200, width: 1),
            verticalInside: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
      ),
    );
  }
}

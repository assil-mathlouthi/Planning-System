import 'package:flutter/material.dart';
import 'package:planning_system/core/utils/app_style.dart';

class GenerateTable extends StatelessWidget {
  final List<String>? keys = [];
  final List<Map<String, dynamic>> instanceList;

  GenerateTable({super.key, required this.instanceList});

  void initKeys() {
    for (var key in instanceList[0].keys) {
      keys!.add(key);
    }
  }

  List<Widget> makeTableHeader(BuildContext context) {
    List<Widget> result = [];
    for (var key in keys!) {
      result.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _capitalize(key), // Capitalize for better display
            style: AppStyles.style18Medium(context), // Use Bold for headers
          ),
        ),
      );
    }

    return result;
  }

  List<TableRow> makeTableRows(BuildContext context) {
    List<TableRow> rows = [];

    // Add header row
    rows.add(TableRow(children: makeTableHeader(context)));

    // Add data rows
    for (var instance in instanceList) {
      List<Widget> rowCells = [];
      for (var key in keys!) {
        rowCells.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              instance[key]?.toString() ?? 'N/A',
              style: AppStyles.style16Regular(context),
            ),
          ),
        );
      }
      rows.add(TableRow(children: rowCells));
    }

    return rows;
  }

  String _capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    initKeys();
    return Table(
      border: TableBorder.all(color: Colors.grey.shade300),
      children: makeTableRows(context),
    );
  }
}

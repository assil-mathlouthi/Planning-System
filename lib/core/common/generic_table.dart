import 'package:flutter/material.dart';
import 'package:planning_system/core/common/cell_content.dart';

import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
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
        ColoredBox(
          color: context.colors.primary,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _capitalize(key),
              style: AppStyles.style18Medium(context),
            ),
          ),
        ),
      );
    }

    return result;
  }

  List<TableRow> makeTableRows(BuildContext context) {
    List<TableRow> rows = [];

    rows.add(TableRow(children: makeTableHeader(context)));

    for (var instance in instanceList) {
      List<Widget> rowCells = [];
      for (var key in keys!) {
        rowCells.add(
          Padding(
            padding: const EdgeInsets.all(8.0),

            child: CellContent(content: instance[key]),
          ),
        );
      }
      var bgColor;
      if (rows.length % 2 == 0) {
        bgColor = context.colors.onPrimary;
      } else {
        bgColor = context.colors.surface;
      }
      rows.add(
        TableRow(
          decoration: BoxDecoration(color: bgColor),
          children: rowCells,
        ),
      );
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
      //ne9sa el border radius mil bottomLeft wo bottomRight
      border: TableBorder(
        // borderRadius: BorderRadius.only(),
        left: BorderSide(width: 1, color: Colors.grey.shade100),
        right: BorderSide(width: 1, color: Colors.grey.shade100),
        bottom: BorderSide(width: 1, color: Colors.grey.shade100),
      ),
      children: makeTableRows(context),
    );
  }
}

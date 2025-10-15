// cell_content.dart
import 'package:flutter/material.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'enum_content.dart';
import 'date_content.dart';

class CellContent extends StatelessWidget {
  final dynamic content;
  const CellContent({super.key, required this.content});
  //TODO : NB examens cell and nb surveillants cell
  @override
  Widget build(BuildContext context) {
    // Handle Enum types
    if (content is Enum) {
      return EnumContent(enumValue: content as Enum);
    }

    // Handle DateTime types
    if (content is DateTime) {
      return DateContent(date: content as DateTime);
    }

    // Handle Widget types
    if (content is Widget) {
      return content as Widget;
    }

    // Handle numeric types with special formatting
    if (content is num) {
      return _buildNumericContent(context);
    }

    // Default content (strings, etc.)
    return _buildDefaultContent(context);
  }

  Widget _buildNumericContent(BuildContext context) {
    return Text(content.toString(), style: AppStyles.style12Regular(context));
  }

  Widget _buildDefaultContent(BuildContext context) {
    return Text(
      content?.toString() ?? 'N/A',
      style: AppStyles.style16Regular(context),
    );
  }
}

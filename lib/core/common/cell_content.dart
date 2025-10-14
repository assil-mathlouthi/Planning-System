import 'package:flutter/widgets.dart';
import 'package:planning_system/core/utils/app_style.dart';

class CellContent extends StatelessWidget {
  final dynamic content;
  const CellContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    if (content is Widget) {
      return content;
    } else {
      return Text(content.toString(), style: AppStyles.style16Regular(context));
    }
  }
}

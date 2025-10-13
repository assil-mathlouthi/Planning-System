import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_style.dart';

class CellContent extends StatelessWidget {
  final dynamic content;
  const CellContent({super.key, required this.content});
  // Widget ReturnByEnum(Enum enumValue){
  // Ya3ni yraja3 widget styles wla yraja3 style hasb el enum eli yet3adelo
  //yaani ken session yraj3 widget wla style specifiee lil session
  // wo baed el build method titcheki ithaken el cell content enum, ylanci el method hethi
  //bch yaarf el widget wla el style eli yelzem yhotou fil cell
  // }
  @override
  Widget build(BuildContext context) {
    if (content is Widget) {
      return content;
    } else {
      return Text(
        content.toString(),
        style: AppStyles.style16Regular(
          context,
        ).copyWith(color: context.colors.secondary),
      );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:planning_system/features/voeux/widgets/voeux_header.dart';
import 'package:planning_system/features/voeux/widgets/voeux_instruction.dart';
import 'package:planning_system/features/voeux/widgets/voeux_table.dart';

class voeuxViewBody extends StatelessWidget {
  const voeuxViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [voeuxHeader(), voeuxInstruction(), voeuxTable()],
      ),
    );
  }
}

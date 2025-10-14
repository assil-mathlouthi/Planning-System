import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/features/voeux/widgets/voeux_header.dart';
import 'package:planning_system/features/voeux/widgets/voeux_instruction.dart';
import 'package:planning_system/features/voeux/widgets/voeux_table.dart';

class VoeuxViewBody extends StatelessWidget {
  const VoeuxViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          VoeuxHeader(),
          SizedBox(height: 20),
          VoeuxInstruction(),
          SizedBox(height: 20),
          VoeuxTable(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:planning_system/core/common/custom_table.dart';
import 'package:planning_system/core/utils/contants.dart';

class VoeuxTableListe extends StatelessWidget {
  const VoeuxTableListe({super.key});

  @override
  Widget build(BuildContext context) {
    return GenerateTable(
      hasDownloadButton: false,
      instanceList: dummyData,
      tag: "Voeux",
    );
  }
}

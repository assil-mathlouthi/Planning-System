import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/custom_table.dart';
import 'package:planning_system/core/utils/contants.dart';
import 'package:planning_system/features/voeux/controller/table_controller.dart';

class PlanningRecapTable extends StatelessWidget {
  //make it take content accordingly
  const PlanningRecapTable({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TableController(), tag: 'hhh');

    Get.put(TableController(), tag: 'hhhh');
    return SizedBox(
      height: 300,
      child: TabBarView(
        children: [
          GenerateTable(instanceList: dummyData, tag: "hhh"),
          GenerateTable(instanceList: dummyData, tag: "hhhh"),
        ],
      ),
    );
  }
}

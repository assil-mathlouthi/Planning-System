import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/custom_table.dart';
import 'package:planning_system/features/planning/widgets/planning_grid.dart';
import 'package:planning_system/core/controller/table_controller.dart';
import 'package:planning_system/features/planning/controllers/planning_recap_controller.dart';

class PlanningRecapTable extends StatelessWidget {
  const PlanningRecapTable({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TableController(), tag: 'planning');
    final recapController = Get.put(PlanningRecapController());
    return SizedBox(
      height: 520,
      child: TabBarView(
        children: [
          // hethi mrigla ya assil ma 3adech tmesha
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: recapController.recapStream,
            builder: (context, snapshot) {
              final data = snapshot.data ?? const <Map<String, dynamic>>[];
              return GenerateTable(instanceList: data, tag: "planning");
            },
          ),
          PlanningGrid(),
        ],
      ),
    );
  }
}

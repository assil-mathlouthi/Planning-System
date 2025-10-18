import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/custom_table.dart';
import 'package:planning_system/features/voeux/controllers/voeux_controller.dart';

class VoeuxTableListe extends StatelessWidget {
  const VoeuxTableListe({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<VoeuxController>();
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: controller.voeuxStream,
      builder: (context, snapshot) {
        final data = snapshot.data ?? const <Map<String, dynamic>>[];
        return GenerateTable(
          hasDownloadButton: false,
          instanceList: data,
          tag: "Voeux",
          onDelete: (row) async {
            final id = row['_id'] as int?;
            if (id != null) {
              await controller.deleteVoeuById(id);
            }
          },
        );
      },
    );
  }
}

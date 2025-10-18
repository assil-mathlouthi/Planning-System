
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/custom_table.dart';
import 'package:planning_system/features/enseignant/controllers/enseignant_controller.dart';

class EnseignantTable extends GetView<EnseignantController> {
  const EnseignantTable({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: controller.enseignantsStream,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          return GenerateTable(
            instanceList: asyncSnapshot.data!,
            tag: "Ens",
            onDelete: (row) async {
              final code = row['_id'] as String?;
              if (code != null && code.isNotEmpty) {
                await controller.deleteEnseignantByCode(code);
              }
            },
            // hasDownloadButton: true,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

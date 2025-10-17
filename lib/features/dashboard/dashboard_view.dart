import 'package:flutter/material.dart';
import 'package:planning_system/core/common/primary_button.dart';
import 'package:planning_system/core/helper/save_and_open_document.dart';
import 'package:planning_system/core/services/pdf/pdf_list_daffectation.dart';
import 'package:planning_system/core/utils/assets.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PrimaryButton(
        icon: Assets.iconsDownload,
        text: "Download",
        onpressed: () async {
          final pdf = await PdfListDaffectation.generateTemplate();

          final savedFile = await SaveAndOpenDocument.savePdf(
            name: "list_daffectation",
            pdf: pdf,
          );

          SaveAndOpenDocument.openPdf(savedFile!);
        },
      ),
    );
  }
}

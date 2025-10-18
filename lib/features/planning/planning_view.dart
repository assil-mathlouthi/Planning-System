import 'package:flutter/material.dart';
import 'package:planning_system/features/planning/widgets/planning_view_body.dart';

// saving pdf logic
// final pdf = await PdfListDaffectation.generateTemplate();
//         final savedFile = await SaveAndOpenDocument.savePdf(
//           name: "list_daffectation.pdf",
//           pdf: pdf,
//         );
//   SaveAndOpenDocument.openPdf(savedFile!);

class PlanningView extends StatelessWidget {
  const PlanningView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: PlanningViewBody());
  }
}

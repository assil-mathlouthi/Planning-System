import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/helper/save_and_open_document.dart';
import 'package:planning_system/core/services/pdf/pdf_list_daffectation.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/planning/controllers/planning_recap_controller.dart';
import 'package:planning_system/features/planning/model/enseignant_pdf_model.dart';
import 'package:planning_system/features/planning/model/grid_item_model.dart';
import 'package:planning_system/features/planning/widgets/grid_export_button.dart';

class PlanningGridCell extends GetView<PlanningRecapController> {
  const PlanningGridCell({super.key, required this.model});
  final GridItemModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        border: BoxBorder.all(color: context.colors.tertiary, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "${model.nom} ${model.prenom}",
            style: AppStyles.style16Regular(
              context,
            ).copyWith(color: context.colors.secondary),
          ),
          12.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${model.nbrSurveillances} surveillances",
                style: AppStyles.style14Regular(context),
              ),
              Text(
                model.semestre.getText,
                style: AppStyles.style14Regular(context),
              ),
            ],
          ),
          12.h,
          GridExportButton(
            onpressed: () async {
              final chunk = await controller.getEnseignantAffectations(
                smartexCode: model.codeSmartex,
              );
              final pdfModels = chunk
                  .map(
                    (e) => EnseignantPdfModel(
                      nom: model.nom,
                      prenom: model.prenom,
                      date: e.date,
                      seanceEnum: e.seanceEnum,
                      duree: 1.5,
                    ),
                  )
                  .toList();
              final pdf = await PdfListDaffectation.generateTemplate(pdfModels);
              final savedFile = await SaveAndOpenDocument.savePdf(
                name: "${model.nom}_${model.prenom}.pdf",
                pdf: pdf,
              );
              SaveAndOpenDocument.openPdf(savedFile!);
            },
          ),
        ],
      ),
    );
  }
}

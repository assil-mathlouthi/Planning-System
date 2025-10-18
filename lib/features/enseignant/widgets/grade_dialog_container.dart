import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/enseignant/controllers/enseignant_controller.dart';
import 'package:planning_system/features/enseignant/models/grade_stat_model.dart';
import 'package:planning_system/features/enseignant/widgets/dialog_button.dart';

class GradeDialogContainer extends GetView<EnseignantController> {
  const GradeDialogContainer({super.key, required this.gradeStatModel});

  final GradeStatModel gradeStatModel;

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController(
      text: gradeStatModel.nbOfSeance.toString(),
    );
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: context.colors.tertiary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: gradeStatModel.gradeEnum.colors.light,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  gradeStatModel.gradeEnum.name.toUpperCase(),
                  style: AppStyles.style12Regular(
                    context,
                  ).copyWith(color: gradeStatModel.gradeEnum.colors.dark),
                ),
              ),
              8.w,
              Text(
                gradeStatModel.gradeEnum.getText,
                style: AppStyles.style16Regular(
                  context,
                ).copyWith(color: context.colors.secondary),
              ),
            ],
          ),
          6.h,
          Row(
            children: [
              Text(
                "${gradeStatModel.total} enseignant(s)\n${gradeStatModel.participants} participant(s)",
                style: AppStyles.style16Regular(
                  context,
                ).copyWith(color: context.colors.onSurface),
              ),
              Spacer(),
              Text(
                "Surveillances par défaut:",
                style: AppStyles.style14Regular(
                  context,
                ).copyWith(color: context.colors.secondary),
              ),
              12.w,
              SizedBox(
                width: 80,
                height: 36,
                child: TextField(
                  controller: textEditingController,
                  style: AppStyles.style14Regular(
                    context,
                  ).copyWith(color: context.colors.secondary),
                  decoration: InputDecoration(
                    fillColor: context.colors.tertiary,
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    border: _buildBorder(),
                    enabledBorder: _buildBorder(),
                    focusedBorder: _buildBorder(),
                  ),
                ),
              ),
            ],
          ),
          16.h,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 17, vertical: 13),
            decoration: BoxDecoration(
              color: Color(0xff17A2B8).withValues(alpha: 0.1),
              border: Border.all(
                color: Color(0xff17A2B8).withValues(alpha: 0.2),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "Le nombre de surveillances par défaut sera automatiquement appliqué aux nouveaux enseignants et lors des imports Excel. Vous pouvez toujours modifier ce nombre individuellement pour chaque enseignant dans le tableau.",
              style: AppStyles.style14Regular(
                context,
              ).copyWith(color: Color(0xff17A2B8)),
            ),
          ),
          16.h,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DialogButton(
                text: "Annuler",
                bgColor: context.colors.surface,
                textColor: context.colors.secondary,
                onPressed: () {
                  Get.back();
                },
                hasBorder: true,
              ),
              8.w,
              DialogButton(
                text: "Enregistrer",
                bgColor: context.colors.primary,
                textColor: context.colors.onPrimary,
                onPressed: () async {
                  await controller.updateGradeNbOfSeance(
                    nb: int.tryParse(textEditingController.text) ?? 0,
                    grade: gradeStatModel.gradeEnum,
                  );
                  Get.back();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide.none,
    );
  }
}

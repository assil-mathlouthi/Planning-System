import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/common/important_widget.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/services/database_controller.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/enseignant/controllers/enseignant_controller.dart';
import 'package:planning_system/features/generation/controller/generation_controller.dart';
import 'package:planning_system/features/generation/services/algo_orchestrator.dart';
import 'package:planning_system/features/generation/widgets/parameter_button.dart';
import 'package:planning_system/features/generation/widgets/parameter_container.dart';
import 'package:planning_system/features/voeux/controllers/voeux_controller.dart';

class MainGenerationViewContainer extends GetView<GenerationController> {
  const MainGenerationViewContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: _decoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Paramètres de génération",
            style: AppStyles.style16Regular(
              context,
            ).copyWith(color: context.colors.secondary),
          ),
          32.h,
          Obx(() {
            return ParameterContainer(
              filled: controller.haveEnseignantData.value,
              title: "Enseignants",
              subtitle: "Aucune donnée importée",
              importTap: () async {
                await Get.find<EnseignantController>().insertAllEnseignant();
              },
            );
          }),
          16.h,
          Obx(() {
            return ParameterContainer(
              filled: controller.haveExamsData.value,
              title: "Examens planifiés",
              subtitle: "Aucune donnée importée",
              importTap: () async {
                Get.find<DatabaseController>()
                    .importExamsAndAffectationsFromExcel();
              },
            );
          }),
          16.h,
          Obx(() {
            return ParameterContainer(
              filled: controller.haveVoeuxData.value,
              title: "voeux de unsurveillance",
              subtitle: "Aucune donnée importée",
              importTap: () async {
                await Get.find<VoeuxController>().insertAllVoeux();
              },
            );
          }),
          24.h,
          if (!controller.canProceedWithGeneration)
            ImportantWidget(
              title: "Données manquantes",
              subTitle:
                  "Veuillez importer tous les fichiers requis (enseignants, examens et vœux) avant de générer le planning.",
            ),
          24.h,
          Divider(height: 0, color: context.colors.tertiary),
          17.h,
          Obx(() {
            final enabled = controller.canProceedWithGeneration;
            return Opacity(
              opacity: enabled ? 1.0 : 0.5,
              child: IgnorePointer(
                ignoring: !enabled,
                child: ParameterButton(
                  icon: Assets.iconsGenerer,
                  text: "Générer le planning",
                  bgColor: context.colors.primary,
                  textColor: context.colors.onPrimary,
                  onTap: () async {
                    try {
                      await Get.put(AlgoOrchestrator()).generateAndSave();

                      Get.snackbar(
                        'Succès',
                        'Planning généré et enregistré',
                        backgroundColor: Get.context?.colors.primary,
                        colorText: Get.context?.colors.onPrimary,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: EdgeInsets.symmetric(
                          horizontal: 200,
                          vertical: 24,
                        ),
                      );
                    } catch (e) {
                      Get.snackbar(
                        'Erreur',
                        'Génération échouée: $e',
                        backgroundColor: Get.context?.colors.primary,
                        colorText: Get.context?.colors.onPrimary,
                        snackPosition: SnackPosition.BOTTOM,
                        margin: EdgeInsets.symmetric(
                          horizontal: 200,
                          vertical: 24,
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  BoxDecoration _decoration(BuildContext context) {
    return BoxDecoration(
      color: context.colors.onPrimary,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: context.colors.tertiary),
    );
  }
}

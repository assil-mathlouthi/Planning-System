import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/enseignant/models/grade_stat_model.dart';

class GradeDialog extends StatelessWidget {
  const GradeDialog({super.key, required this.gradeStatModel});

  final GradeStatModel gradeStatModel;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(25),
          width: 512,
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Configuration des surveillances par grade",
                    style: AppStyles.style18Bold(context),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.close),
                  ),
                ],
              ),
              9.h,
              Text(
                "Spécifiez le nombre de surveillances par défaut pour chaque grade. Ce nombre sera automatiquement appliqué aux nouveaux enseignants et lors des imports.",
                style: AppStyles.style14Regular(
                  context,
                ).copyWith(color: context.colors.onSurface),
              ),
              32.h,
              Container(
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
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: gradeStatModel.gradeEnum.colors.light,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            gradeStatModel.gradeEnum.name.toUpperCase(),
                            style: AppStyles.style12Regular(context).copyWith(
                              color: gradeStatModel.gradeEnum.colors.dark,
                            ),
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
                          "${gradeStatModel.total} enseignant(s)",
                          style: AppStyles.style16Regular(
                            context,
                          ).copyWith(color: context.colors.onSurface),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

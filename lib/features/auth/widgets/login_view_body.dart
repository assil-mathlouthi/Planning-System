import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/core/utils/app_style.dart';
import 'package:planning_system/features/auth/controller/login_controller.dart';
import 'package:planning_system/features/auth/widgets/login_field_widget.dart';
import 'package:planning_system/features/auth/widgets/logo_widget.dart';
import 'package:planning_system/features/enseignant/widgets/dialog_button.dart';

class LoginViewBody extends GetView<LoginController> {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 448,
        padding: EdgeInsets.all(24),
        decoration: _buildDecoration(context),
        child: Obx(
          () => Form(
            key: controller.formKey,
            autovalidateMode: controller.autoValidate.value,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                LogoWidget(),
                12.h,
                Text(
                  "Surveillance Planning",
                  textAlign: TextAlign.center,
                  style: AppStyles.style24Regular(
                    context,
                  ).copyWith(color: context.colors.primary),
                ),
                8.h,
                Text(
                  "Système de gestion des surveillances",
                  textAlign: TextAlign.center,
                  style: AppStyles.style16Regular(
                    context,
                  ).copyWith(color: context.colors.onSurface),
                ),
                56.h,
                LoginFieldWidget(
                  label: "Email",
                  hint: "votre.email@example.com",
                  textEditingController: controller.emailController,
                ),
                24.h,
                LoginFieldWidget(
                  label: "Mot de passe",
                  hint: "••••••••",
                  isPassword: true,
                  textEditingController: controller.passwordController,
                ),
                24.h,
                SizedBox(
                  height: 36,
                  child: DialogButton(
                    text: "Se connecter",
                    bgColor: context.colors.primary,
                    textColor: context.colors.onPrimary,
                    onPressed: controller.validateAndSubmit,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Decoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.colors.onPrimary,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 25),
          blurRadius: 50,
          spreadRadius: -12,
          color: Colors.black.withValues(alpha: 0.25),
        ),
      ],
    );
  }
}

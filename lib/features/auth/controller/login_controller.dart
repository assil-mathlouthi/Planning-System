import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/utils/app_router.dart';
import 'package:planning_system/core/config/app_config.dart';

class LoginController extends GetxController {
  // Create the key
  final formKey = GlobalKey<FormState>();
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> validateAndSubmit() async {
    if (!formKey.currentState!.validate()) {
      autoValidate.value = AutovalidateMode.always;
      return;
    }

    final ok = await AppConfig.validateCredentials(
      email: emailController.text,
      password: passwordController.text,
    );
    if (ok) {
      autoValidate.value = AutovalidateMode.disabled;
      Get.toNamed(AppRouter.homeView);
    } else {
      Get.snackbar(
        'Échec de connexion',
        'Email ou mot de passe incorrect',
        backgroundColor: Get.context?.colors.onPrimary,
        colorText: Get.context?.colors.primary,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.symmetric(horizontal: 200, vertical: 24),
      );
    }
  }
}

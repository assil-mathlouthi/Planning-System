import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/utils/app_router.dart';

class LoginController extends GetxController {
  // Create the key
  final formKey = GlobalKey<FormState>();
  Rx<AutovalidateMode> autoValidate = AutovalidateMode.disabled.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Veuillez entrer votre email';
    }
    final email = value.trim();
    final emailReg = RegExp(r'^[\w\.\-]+@[\w\.\-]+\.\w+$');
    if (!emailReg.hasMatch(email)) {
      return 'Email invalide';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez entrer votre mot de passe';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    final hasLetter = value.contains(RegExp(r'[A-Za-z]'));
    final hasNumber = value.contains(RegExp(r'\d'));
    if (!hasLetter || !hasNumber) {
      return 'Le mot de passe doit contenir des lettres et des chiffres';
    }
    return null;
  }

  void validateAndSubmit() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRouter.homeView);
      autoValidate.value = AutovalidateMode.disabled;
    } else {
      autoValidate.value = AutovalidateMode.always;
    }
  }
}

import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle style24Medium(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style24Regular(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onPrimary,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle style20Medium(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style16Regular(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle style16Meduim(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style14Regular(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
    );
  }

  static TextStyle style13Regular(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, fontSize: 13),
    );
  }

  static TextStyle style18Medium(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style18Regular(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  var width = MediaQuery.sizeOf(context).width;
  double scaleFactor = width / 1850;
  double responsiveFontSize = fontSize * scaleFactor;
  return responsiveFontSize.clamp(fontSize * 0.8, fontSize * 1.2);
}

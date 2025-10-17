import 'package:flutter/material.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';

abstract class AppStyles {
  static TextStyle style24Medium(BuildContext context) {
    return TextStyle(
      color: context.colors.primary,
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
      color: context.colors.onSurface,

      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }

  static TextStyle style12Regular(BuildContext context) {
    return TextStyle(
      color: context.colors.secondary,

      fontSize: getResponsiveFontSize(context, fontSize: 12),
    );
  }

  static TextStyle style16Bold(BuildContext context) {
    return TextStyle(
      color: context.colors.secondary,
      fontWeight: FontWeight.bold,
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
      color: context.colors.onSurface,
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
      color: context.colors.secondary,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle style18Regular(BuildContext context) {
    return TextStyle(
      color: context.colors.secondary,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
    );
  }

  static TextStyle style18Bold(BuildContext context) {
    return TextStyle(
      color: context.colors.secondary,
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.bold,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  var width = MediaQuery.sizeOf(context).width;
  double scaleFactor = width / 1850;
  double responsiveFontSize = fontSize * scaleFactor;
  return responsiveFontSize.clamp(fontSize * 0.8, fontSize * 1.2);
}

import 'package:flutter/material.dart';

abstract class AppStyles {
  static TextStyle style20Medium(BuildContext context) {
    return TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
      letterSpacing: 1.6,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  var width = MediaQuery.sizeOf(context).width;
  double scaleFactor = width / 1850;
  double responsiveFontSize = fontSize * scaleFactor;
  return responsiveFontSize.clamp(fontSize * 0.8, fontSize * 1.2);
}

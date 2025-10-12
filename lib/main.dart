import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/utils/app_router.dart';
import 'package:planning_system/core/utils/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      // initialBinding: AppBindings(),
      getPages: AppRouter.getViews(),
    );
  }
}

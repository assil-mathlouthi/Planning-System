import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/utils/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialBinding: AppBindings(),
      getPages: AppRouter.getViews(),
    );
  }
}

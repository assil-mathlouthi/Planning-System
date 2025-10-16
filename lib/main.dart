import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:planning_system/core/binding/app_bindings.dart';
import 'package:planning_system/core/utils/app_router.dart';
import 'package:planning_system/core/utils/app_theme.dart';
import 'package:planning_system/core/utils/contants.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    minimumSize: kWindowSize,
    size: kWindowSize,
    center: true,
    // TODO: fix title
    title: "Welcome to the vortex",
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      getPages: AppRouter.getViews(),
      initialBinding: AppBindings(),
    );
  }
}

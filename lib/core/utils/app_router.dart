import 'package:get/get.dart';
import 'package:planning_system/features/auth/views/login_view.dart';
import 'package:planning_system/features/home/home_view.dart';

abstract class AppRouter {
  static const String loginView = "/homeView";
  static const String homeView = "/";

  static List<GetPage<dynamic>>? getViews() {
    return [
      GetPage(name: homeView, page: () => const HomeView()),
      GetPage(name: loginView, page: () => const LoginView()),
    ];
  }
}

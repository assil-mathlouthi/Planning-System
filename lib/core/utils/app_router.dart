import 'package:get/get.dart';
import 'package:planning_system/features/home/views/home_view.dart';


abstract class AppRouter {
  static const String homeView = "/";
  static const String gameSetupView = "/gameSetup";
  static const String waitingRoom = "/waitingRoom";
  static const String settingsView = "/settingsView";
  static const String aboutUs = "/aboutUs";
  static const String gameView = "/gameView";
  static const String counterView = "/counterView";
  static const String challengeView = "/challengeView";
  static const String useCardView = "/useCardView";


  static List<GetPage<dynamic>>? getViews() {
    return [
      GetPage(name: homeView, page: () => const HomeView()),
      
    ];
  }
}

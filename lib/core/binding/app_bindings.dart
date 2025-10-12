import 'package:get/get.dart';
import 'package:planning_system/features/home/controllers/navigation_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);
    // Get.lazyPut(() => SelectionAnimationController());
    // Get.lazyPut(() => GameSetupController(), fenix: true);
    // Get.lazyPut(() => SettingsController());
    // Get.lazyPut(() => ChallengeController());
  }
}

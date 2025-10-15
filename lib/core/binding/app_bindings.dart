import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';
import 'package:planning_system/core/services/database_service.dart';
import 'package:planning_system/core/services/excel_services.dart';
import 'package:planning_system/core/services/file_picker_service.dart';
import 'package:planning_system/features/home/controllers/navigation_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);
    // Services
    Get.put<FilePickerInterface>(FilePickerService(), permanent: true);
    Get.put<ExcelService>(
      ExcelService(picker: Get.find<FilePickerInterface>()),
      permanent: true,
    );
    Get.put(DatabaseService(db: AppDb()));
    // Get.lazyPut(() => SelectionAnimationController());
    // Get.lazyPut(() => GameSetupController(), fenix: true);
    // Get.lazyPut(() => SettingsController());
    // Get.lazyPut(() => ChallengeController());
  }
}

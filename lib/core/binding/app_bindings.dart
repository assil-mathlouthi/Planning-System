import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';
import 'package:planning_system/core/interface/file_picker_interface.dart';
import 'package:planning_system/core/services/database_controller.dart';
import 'package:planning_system/core/services/excel_services.dart';
import 'package:planning_system/core/services/file_picker_service.dart';
import 'package:planning_system/features/auth/controller/login_controller.dart';
import 'package:planning_system/core/services/saver/file_saver_service.dart';
import 'package:planning_system/features/enseignant/controllers/enseignant_controller.dart';
import 'package:planning_system/features/generation/controller/generation_controller.dart';
import 'package:planning_system/features/home/controllers/navigation_controller.dart';
import 'package:planning_system/features/voeux/controllers/voeux_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationController(), permanent: true);
    // Services
    Get.put<FilePickerInterface>(FilePickerService(), permanent: true);
    Get.put<ExcelService>(
      ExcelService(
        picker: Get.find<FilePickerInterface>(),
        saver: LocalFileSaver(),
      ),
      permanent: true,
    );

    if (!Get.isRegistered<AppDb>()) {
      Get.put(AppDb(), permanent: true);
    }
    Get.lazyPut(() => EnseignantController(), fenix: true);
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => VoeuxController(), fenix: true);
    Get.lazyPut(() => GenerationController(),fenix: true);
    Get.lazyPut(() => DatabaseController());
  }
}

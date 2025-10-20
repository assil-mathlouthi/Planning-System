import 'package:get/get.dart';
import 'package:planning_system/core/database/db.dart';

class GenerationController extends GetxController {
  RxBool haveEnseignantData = false.obs;
  RxBool haveVoeuxData = false.obs;
  RxBool haveExamsData = false.obs;

  late final AppDb _db;

  bool get canProceedWithGeneration =>
      haveEnseignantData.value && haveVoeuxData.value && haveExamsData.value;

  @override
  void onInit() {
    super.onInit();
    _db = Get.find<AppDb>();

    // Update flags reactively whenever underlying tables change
    haveEnseignantData.bindStream(
      _db.select(_db.enseignantsTable).watch().map((rows) => rows.isNotEmpty),
    );

    haveVoeuxData.bindStream(
      _db.select(_db.voeuxTable).watch().map((rows) => rows.isNotEmpty),
    );

    haveExamsData.bindStream(
      _db.select(_db.examenTable).watch().map((rows) => rows.isNotEmpty),
    );

  }

  List<String> get missingDataLabels {
    final missing = <String>[];
    if (!haveEnseignantData.value) missing.add('Enseignants');
    if (!haveVoeuxData.value) missing.add('Voeux');
    if (!haveExamsData.value) missing.add('Examens');
    return missing;
  }
}

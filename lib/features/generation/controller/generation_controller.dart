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

    // Prime initial values immediately for first UI frame
    // ignore: discarded_futures
    // refreshFlagsOnce();
  }

  // /// Optional: one-off refresh for UI actions that want an immediate check
  // Future<void> refreshFlagsOnce() async {
  //   final enseignantsCount =
  //       (await _db.select(_db.enseignantsTable).get()).length;
  //   final voeuxCount = (await _db.select(_db.voeuxTable).get()).length;
  //   final examsCount = (await _db.select(_db.examenTable).get()).length;

  //   haveEnseignantData.value = enseignantsCount > 0;
  //   haveVoeuxData.value = voeuxCount > 0;
  //   haveExamsData.value = examsCount > 0;
  // }

  /// Returns a user-friendly list of missing datasets to unblock generation.
  List<String> get missingDataLabels {
    final missing = <String>[];
    if (!haveEnseignantData.value) missing.add('Enseignants');
    if (!haveVoeuxData.value) missing.add('Voeux');
    if (!haveExamsData.value) missing.add('Examens');
    return missing;
  }
}

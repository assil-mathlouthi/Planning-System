import 'package:get/get.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/home/models/side_navigation_item_model.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<SideNavigationItemModel> items = [
    SideNavigationItemModel(icon: Assets.iconsEnseignants, text: "Enseignants"),
    SideNavigationItemModel(
      icon: Assets.iconsVoeux,
      text: "Voeux de surveillance",
    ),
    SideNavigationItemModel(icon: Assets.iconsGeneration, text: "Génération"),
    SideNavigationItemModel(icon: Assets.iconsPlanning, text: "Planning"),
  ];

  void updateCurrentIndex({required int index}) {
    currentIndex.value = index;
  }
}

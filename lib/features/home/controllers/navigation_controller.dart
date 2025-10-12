import 'package:get/get.dart';
import 'package:planning_system/core/utils/assets.dart';
import 'package:planning_system/features/home/models/side_navigation_item_model.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<SideNavigationItemModel> items = [
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
      isActive: true,
    ),
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
    ),
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
    ),
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
    ),
    SideNavigationItemModel(
      icon: Assets.iconsDashboard,
      text: "Tableau de bord",
    ),
  ];

  void updateCurrentIndex({required int index}) {
    currentIndex.value = index;
  }
}

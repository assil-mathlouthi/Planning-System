class SideNavigationItemModel {
  final String icon;
  final String text;
  final bool isActive;

  SideNavigationItemModel({
    required this.icon,
    required this.text,
    this.isActive = false,
  });
}

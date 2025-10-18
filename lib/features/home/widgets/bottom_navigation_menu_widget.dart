import 'package:flutter/widgets.dart';
import 'package:planning_system/core/extensions/color_scheme_shorthand.dart';
import 'package:planning_system/core/extensions/gap_with_sized_box.dart';
import 'package:planning_system/features/home/widgets/logout_widget.dart';
import 'package:planning_system/features/home/widgets/user_widget.dart';

class BottomNavigationMenuWidget extends StatelessWidget {
  const BottomNavigationMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: _buildDecoration(context),
      child: Column(
        children: [
          UserWidget(userName: "Admin ISI", email: 'admin@isi.tn'),
          12.h,
          LogoutWidget(),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border(
        right: BorderSide(color: context.colors.tertiary),
        bottom: BorderSide(color: context.colors.tertiary),
      ),
    );
  }
}

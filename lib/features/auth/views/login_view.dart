import 'package:flutter/material.dart';
import 'package:planning_system/features/auth/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff2C5AA0), Color(0xff2C5AA0), Color(0xff1447E6)],
          begin: Alignment.topLeft,
          stops: [0.0, 0.5, 1.0],
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LoginViewBody(),
      ),
    );
  }
}

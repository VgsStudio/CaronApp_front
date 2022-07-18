import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Image.asset("assets/images/CaronApp.png")],
        ),
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
      ),
    );
  }
}

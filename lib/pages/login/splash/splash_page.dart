import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:caronapp_front/pages/login/login/login_page.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../shared/themes/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

int timer = 1000;

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() async {
    await Future.delayed(Duration(milliseconds: timer), () {});
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (c, a1, a2) => LoginPage(),
            transitionsBuilder: (c, anim, a2, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: Duration(milliseconds: timer)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: timer),
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 64),
                    Image.asset(AppLogo.caronApp,
                        filterQuality: FilterQuality.high, scale: 3),
                    SizedBox(height: 32),
                    SpinKitRing(color: AppColors.vermelhoGrena, size: 40),
                  ],
                ),
              ),
              Image.asset(
                AppLogo.imt,
                filterQuality: FilterQuality.high,
                scale: 6,
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

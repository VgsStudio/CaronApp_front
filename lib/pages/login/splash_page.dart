import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../shared/themes/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

int timer = 750;

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: timer), () {});
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (c, a1, a2) => HomePage(),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/LogoIMT.png",
                  filterQuality: FilterQuality.high,
                  scale: 4,
                ),
                SizedBox(height: 32),
                Image.asset("assets/images/CaronApp.png",
                    filterQuality: FilterQuality.high, scale: 3),
                SizedBox(height: 32),
                SpinKitRing(color: AppColors.vermelhoGrena, size: 40)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:caronapp_front/pages/login/login_page.dart';
import 'package:caronapp_front/pages/login/splash_page.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CaronApp',
      theme: ThemeData(
          fontFamily: GoogleFonts.koHo().fontFamily,
          colorScheme: ColorScheme.dark().copyWith(
            primary: AppColors.vermelhoGrena,
            surface: AppColors.cinzaBackground,
          )),
      home: SplashPage(),
    );
  }
}

import 'package:flutter/cupertino.dart';

class AppColors {
  static final vermelhoGrena = Color(0xFFB82423);
  static final cinzaBackground = Color(0xFF383838);
  static final cinzaClaro = Color(0xFF312B2B);
  static final whiteSub = Color(0xFFD6D6D6);

  static final gradientBackgroundList = [
    AppColors.cinzaBackground,
    AppColors.cinzaClaro
  ];

  static final backgroundGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: AppColors.gradientBackgroundList);
}

import 'package:flutter/cupertino.dart';

class AppColors {
  static final vermelhoGrena = Color(0xFFB82423);
  static final cinzaBackground = Color(0xFF383838);
  static final cinzaEscuro = Color(0xFF202020);
  static final cinzaClaro = Color(0xFF312B2B);
  static final whiteSub = Color(0xFF8F8F8F);

  static final gradientBackgroundList = [
    AppColors.cinzaBackground,
    AppColors.cinzaClaro
  ];

  static final backgroundGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: AppColors.gradientBackgroundList);
}

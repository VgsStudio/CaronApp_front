import 'package:flutter/material.dart';

class AppColors {
  static final vermelhoGrena = Color(0xFFB82423);
  static final cinzaBackground = Color(0xFF383838);
  static final cinzaEscuro = Color(0xFF202020);
  static final cizaMedio = Color(0xFF312B2B);
  static final cinzaClaro = Color(0xFF808080);
  
  static final preto = Color(0xFF000000);
  static final brancosSub = Color(0xFFD6D6D6);

  static final gradientBackgroundList = [
    AppColors.cinzaBackground,
    AppColors.cizaMedio
  ];

  static final backgroundGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: AppColors.gradientBackgroundList);
}

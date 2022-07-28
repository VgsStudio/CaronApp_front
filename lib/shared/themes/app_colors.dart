import 'package:flutter/material.dart';

class AppColors {
  static const vermelhoGrena = Color(0xFFB82423);
  static const cinzaBackground = Color(0xFF383838);
  static const cinzaEscuro = Color(0xFF202020);
  static const cizaMedio = Color(0xFF312B2B);
  static const cinzaClaro = Color(0xFF808080);
  static const cinzaMaisClaro = Color(0xFF8A8A8A);
  static const pretoSub = Color(0xFF161616);
  static const preto = Color(0xFF000000);
  static const brancosSub = Color(0xFFD6D6D6);
  static const branco = Colors.white;

  static const gradientBackgroundList = [
    AppColors.cinzaBackground,
    AppColors.cizaMedio
  ];

  static const backgroundGradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: AppColors.gradientBackgroundList);
}

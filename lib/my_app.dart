import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaronApp',
      theme: ThemeData(
          fontFamily: 'KoHo',
          colorScheme: ColorScheme.dark().copyWith(
            primary: AppColors.vermelhoGrena,
            surface: AppColors.cinzaBackground,
          )),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

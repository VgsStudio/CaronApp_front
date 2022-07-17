import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cinzaBackground,
      body: Center(
        child: Text(
          "Bem Vinde ao CaronApp",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

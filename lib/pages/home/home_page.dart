import 'package:caronapp_front/shared/botoes/app_botoes.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../mapa/mapa_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _navigateToMapa() {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => MapaPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bem Vinde ao CaronApp",
                style: TextStyle(fontSize: 16),
              ),
              BotaoVermelho(child: "Mapa", onPressed: _navigateToMapa)
            ],
          ),
        ),
      ),
    );
  }
}

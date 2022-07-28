import 'package:caronapp_front/pages/home/widgets/home_locais_widget.dart';
import 'package:caronapp_front/pages/mapa/entities.dart/locais_json.dart';
import 'package:caronapp_front/shared/widgets/botaoVermelho_widget.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../shared/logo/app_logos.dart';
import '../mapa/mapa_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
    var tamanhoTela = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.vermelhoGrena,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: Text("Vitor"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        decoration: const BoxDecoration(color: AppColors.pretoSub),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              // Logo Caronapp
              AppLogo.caronApp,
              filterQuality: FilterQuality.high,
              scale: 5,
            ),
            Container(
              // Mapa
              width: tamanhoTela.width * 0.8,
              height: tamanhoTela.width * 0.45,
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(16)),
            ),
            SizedBox(
              width: tamanhoTela.width * 0.8,
              child: TextFormField(
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.cinzaClaro,
                ),
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.access_time),
                    contentPadding: const EdgeInsets.only(left: 8),
                    hintText: "Para onde deseja ir?",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: AppColors.cinzaEscuro),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
                children: List.generate(
                    locaisList.length < 4 ? locaisList.length : 4,
                    (index) => HomeLocaisWidget(local: locaisList[index]))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BottomHomeScreenWidget(icone: Icons.reply, onTap: () {}),
                BottomHomeScreenWidget(
                  icone: Icons.calendar_today,
                  onTap: () {},
                ),
              ],
            )
            // const Text(
            //   "Bem Vinde ao CaronApp",
            //   style: TextStyle(fontSize: 16),
            // ),
            // BotaoVermelhoWidget(child: "Mapa", onPressed: _navigateToMapa)
          ],
        ),
      ),
    );
  }
}

class BottomHomeScreenWidget extends StatelessWidget {
  final icone;
  final onTap;

  const BottomHomeScreenWidget({
    Key? key,
    required this.icone,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        width: 120,
        height: 64,
        decoration: BoxDecoration(
            color: AppColors.cinzaEscuro,
            borderRadius: BorderRadius.circular(16)),
        child: Icon(
          icone,
          size: 40,
        ),
      ),
    );
  }
}

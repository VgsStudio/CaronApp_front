import 'package:caronapp_front/pages/mapa/mapa_page.dart';
import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/pages/motorista/perfil/chat_profile_page.dart';
import 'package:caronapp_front/pages/motorista/perfil/support_profile_page.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:flutter/material.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:multiavatar/multiavatar.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

class DriverProfilePage extends StatelessWidget {
  final Motorista motorista;
  static final _random = Random();
  static final _viagens = _random.nextInt(100) + 20;
  static var listaimagens = [
    '../assets/images/PlacasCarros/Placa1.png',
    '../assets/images/PlacasCarros/Placa2.png',
    '../assets/images/PlacasCarros/Placa3.png',
  ];
  var imagemrnd = listaimagens[_random.nextInt(listaimagens.length)];

  DriverProfilePage({Key? key, required this.motorista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                    iconSize: 4,
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 32,
                      ),
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: AppColors.cinzaClaro,
                      borderRadius: BorderRadius.circular(52),
                      border: Border.all(color: AppColors.brancosSub, width: 3),
                    ),
                    child: SvgPicture.string(
                        height: 75,
                        width: 75,
                        multiavatar(motorista.foto, trBackground: true))),
                const Padding(padding: EdgeInsets.only(left: 20)),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Nota: ${motorista.rate.toStringAsFixed(2)}',
                          textScaleFactor: 1.5,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 2),
                        ),
                        const Icon(
                          Icons.star,
                          color: AppColors.brancosSub,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          '${motorista.idade} anos',
                          textScaleFactor: 1.5,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              motorista.nome,
                              textScaleFactor: 1.5,
                              style: const TextStyle(
                                color: AppColors.brancosSub,
                              ),
                            ),
                            Text(
                              motorista.sobrenome,
                              textScaleFactor: 1.5,
                              style: const TextStyle(
                                color: AppColors.brancosSub,
                              ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(right: 8)),
                        Icon(
                          Icons.verified,
                          color: AppColors.azulClaro,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.assignment),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Text(motorista.curso, textScaleFactor: 1.5),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Container(
                width: MediaQuery.of(context).size.width / 1.2,
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: AppColors.cinzaEscuro,
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Bio: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra orci sagittis eu volutpat odio facilisis mauris.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                  textAlign: TextAlign.justify,
                  textScaleFactor: 1.2,
                )),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.directions_car),
                          const Padding(padding: EdgeInsets.only(right: 5)),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(motorista.carro,
                                style: const TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                      Image.asset(
                        imagemrnd.toString(),
                        fit: BoxFit.scaleDown,
                        scale: 5.8,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('Selos Recentes: ',
                            style: TextStyle(fontSize: 18)),
                      ),
                      Image.asset(
                        '../assets/images/Selo1.png',
                        fit: BoxFit.scaleDown,
                        scale: 12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),
            Text('${motorista.nome} ${motorista.sobrenome} já realizou:',
                textAlign: TextAlign.center, textScaleFactor: 1.2),
            SizedBox(height: MediaQuery.of(context).size.height / 100),
            Container(
              width: MediaQuery.of(context).size.width / 1.8,
              decoration: BoxDecoration(
                  color: AppColors.cinzaEscuro,
                  borderRadius: BorderRadius.circular(15)),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.airport_shuttle),
                    Text(
                      '  $_viagens Viagens!',
                      textScaleFactor: 1.5,
                    ),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 2))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 100,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: const Icon(
                          Icons.warning,
                          size: 60,
                        ),
                        tooltip: 'Denunciar!',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SupportProfilePage(
                                      motorista: motorista,
                                    )),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: const Icon(
                          Icons.chat,
                          size: 60,
                        ),
                        tooltip: 'Chat',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatProfilePage(
                                      motorista: motorista,
                                    )),
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppLogo.imtQuadrado,
                    filterQuality: FilterQuality.high,
                    width: 96,
                    height: 96,
                  ),
                  SizedBox(
                    width: tamanhoTela.width * 0.1,
                  ),
                  Image.asset(
                    AppLogo.dev,
                    filterQuality: FilterQuality.high,
                    width: 88,
                    height: 88,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

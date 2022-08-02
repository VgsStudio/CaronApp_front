import 'package:caronapp_front/pages/mapa/mapa_page.dart';
import 'package:caronapp_front/pages/motorista/perfil/chat_profile_page.dart';
import 'package:caronapp_front/pages/motorista/perfil/support_profile_page.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:flutter/material.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:multiavatar/multiavatar.dart';
import 'package:username_gen/username_gen.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';

class DriverProfilePage extends StatelessWidget {
  static final _random = Random();
  static final _nota = _random.nextInt(5) + 1;
  static final _idade = _random.nextInt(23) + 18;
  final username = UsernameGen().generate();
  static final _viagens = _random.nextInt(100) + 20;
  static var listaimagens = [
    '../assets/images/PlacasCarros/Placa1.png',
    '../assets/images/PlacasCarros/Placa2.png',
    '../assets/images/PlacasCarros/Placa3.png',
  ];
  var imagemrnd = listaimagens[_random.nextInt(listaimagens.length)];

  DriverProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
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
                      height: 100,
                      width: 100,
                      multiavatar(username, trBackground: true))),
              const Padding(padding: EdgeInsets.only(left: 20)),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Nota: $_nota',
                        textScaleFactor: 1.5,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 2),
                      ),
                      const Icon(
                        Icons.star,
                        color: AppColors.brancosSub,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                      ),
                      Text(
                        '$_idade anos',
                        textScaleFactor: 1.5,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 20)),
                      Text(
                        username,
                        textScaleFactor: 1.5,
                        style: const TextStyle(
                          color: AppColors.brancosSub,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(right: 5)),
                      const Icon(
                        Icons.verified,
                        color: AppColors.azulClaro,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.assignment),
                      Padding(padding: EdgeInsets.only(left: 5)),
                      Text('Engenharia Química', textScaleFactor: 1.5),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          Container(
              width: MediaQuery.of(context).size.width / 1.2,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.brancosSub, width: 2),
                  color: AppColors.cinzaClaro,
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Bio: Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Viverra orci sagittis eu volutpat odio facilisis mauris.',
                textAlign: TextAlign.center,
                textScaleFactor: 1.2,
              )),
          SizedBox(height: MediaQuery.of(context).size.height / 15),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.directions_car),
                    const Padding(padding: EdgeInsets.only(right: 5)),
                    const Text(
                      'Meriva 2014',
                      textScaleFactor: 1.5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    const Text(
                      'Selos Recentes: ',
                      textScaleFactor: 1.5,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      imagemrnd.toString(),
                      scale: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2.8,
                    ),
                    Image.asset(
                      '../assets/images/Selo1.png',
                      scale: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          Text('$username já realizou:', textScaleFactor: 1.2),
          SizedBox(height: MediaQuery.of(context).size.height / 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.map),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 2)),
              Container(
                  decoration: BoxDecoration(
                      color: AppColors.cinzaClaro,
                      border: Border.all(color: AppColors.brancosSub),
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    '  $_viagens Viagens!  ',
                    textScaleFactor: 1.5,
                  ))
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            builder: (context) => SupportProfilePage()),
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
                            builder: (context) =>
                                ChatProfilePage(username: username)),
                      );
                    }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppLogo.imt,
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 5,
              ),
              Image.asset(
                AppLogo.dev,
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 5,
              )
            ],
          )
        ],
      ),
    ));
  }
}

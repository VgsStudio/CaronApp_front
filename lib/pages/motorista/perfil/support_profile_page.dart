import 'dart:math';
import 'package:caronapp_front/pages/motorista/perfil/driver_profile_page.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';
import 'package:username_gen/username_gen.dart';

import 'widget/support_opcao_widget.dart';

class SupportProfilePage extends StatelessWidget {
  SupportProfilePage({Key? key}) : super(key: key);

  static final _random = Random();
  static final _nota = _random.nextInt(5) + 1;
  static final _idade = _random.nextInt(23) + 18;
  final username = UsernameGen().generate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              height: 40,
              width: 40,
              child: IconButton(
                  padding: const EdgeInsets.all(0.0),
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 40,
                  ),
                  tooltip: 'Voltar',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DriverProfilePage()),
                    );
                  }),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
                color: AppColors.cinzaEscuro,
                border: Border.all(color: AppColors.brancosSub, width: 3),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
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
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          const Text('Acionar a polícia!', textScaleFactor: 2),
          SizedBox(
            child: SizedBox(
                height: 60,
                width: 60,
                child: IconButton(
                    padding: const EdgeInsets.all(0.0),
                    icon: const Icon(
                      Icons.privacy_tip,
                      size: 60,
                      color: AppColors.vermelhoGrena,
                    ),
                    tooltip: 'Acionar!',
                    onPressed: () {})),
          ),
          const Text('O que deseja reportar sobre o mostorista?',
              textAlign: TextAlign.center, textScaleFactor: 1.5),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Ocorreu um roubo durante a carona',
          ),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Ocorreu um acidente durante a carona',
          ),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Ocorreu uma discriminação/injúria',
          ),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Foto/Nome não condiz com o motôrista',
          ),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Reportar outro problema',
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                AppLogo.imt,
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 5,
              ),
              Image.asset(
                AppLogo.caronApp,
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 5,
              )
            ],
          )
        ],
      ),
    );
  }
}

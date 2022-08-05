import 'dart:math';
import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/pages/motorista/perfil/driver_profile_page.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/app_bar_transparente_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';
import 'package:username_gen/username_gen.dart';

import 'widget/support_opcao_widget.dart';

class SupportProfilePage extends StatelessWidget {
  static final _random = Random();
  final Motorista motorista;
  final username = UsernameGen().generate();

  SupportProfilePage({Key? key, required this.motorista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBarTransparenteWidget()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 24),
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
                        const Padding(
                          padding: EdgeInsets.only(right: 10),
                        ),
                        Text(
                          '${motorista.idade} anos',
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
                          '${motorista.nome} ${motorista.sobrenome}',
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
                AppLogo.dev,
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

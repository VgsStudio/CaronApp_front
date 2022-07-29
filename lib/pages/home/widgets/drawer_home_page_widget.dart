import 'dart:developer';

import 'package:caronapp_front/models/usuario/usuarios_json.dart';
import 'package:caronapp_front/pages/home/widgets/profile_header_drawer_widget.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multiavatar/multiavatar.dart';

import 'drawer_menu_option_widget.dart';

class DrawerHomePageWidget extends StatelessWidget {
  const DrawerHomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColors.cinzaBackground,
        child: Container(
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: AppColors.cinzaEscuro),
                child: ProfileHeaderDrawerWidget(
                  info: usuariosList[2],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    DrawerMenuOptionWidget(
                      option: "Caronas anteriores",
                      onTap: () {},
                    ),
                    DrawerMenuOptionWidget(
                      option: "Histórico de gorjetas",
                      onTap: () {},
                    ),
                    DrawerMenuOptionWidget(
                      option: "Configurações",
                      onTap: () {},
                    ),
                    DrawerMenuOptionWidget(
                      option: "Ajuda",
                      onTap: () {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Versão:"),
                        Text("0.1.0"),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:caronapp_front/models/usuario/usuarios_json.dart';
import 'package:caronapp_front/pages/home/widgets/profile_header_drawer_widget.dart';
import 'package:caronapp_front/pages/login/login/login_page.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'drawer_menu_option_widget.dart';

class DrawerHomePageWidget extends StatelessWidget {
  const DrawerHomePageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToLogin() async {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (c, a1, a2) => const LoginPage(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: const Duration(milliseconds: 500)));
    }

    return Drawer(
        backgroundColor: AppColors.cinzaBackground,
        child: SizedBox(
          width: double.infinity,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(color: AppColors.cinzaEscuro),
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
                    DrawerMenuOptionWidget(
                      option: "Sair",
                      onTap: navigateToLogin,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Versão:"),
                        Text("0.1.2"),
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

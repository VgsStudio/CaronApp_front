import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../shared/logo/app_logos.dart';
import 'widgets/ra_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Center(
          child: SizedBox(
            width: tamanhoTela.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppLogo.caronApp,
                  filterQuality: FilterQuality.high,
                  scale: 6,
                ),
                RaWidget(tamanhoTela: tamanhoTela),
                Text("Senha"),
                Text("Esqueceu a senha"),
                Text("Login"),
                Text("Cadastre-se"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppLogo.imtQuadrado,
                      filterQuality: FilterQuality.high,
                      width: 80,
                      height: 80,
                    ),
                    Image.asset(
                      AppLogo.dev,
                      filterQuality: FilterQuality.high,
                      width: 80,
                      height: 80,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

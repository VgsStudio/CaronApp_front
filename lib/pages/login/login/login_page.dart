import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/botaoVermelho_widget.dart';
import '../../../shared/logo/app_logos.dart';
import '../widgets/custom_textfield_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    navigateToHome() async {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (c, a1, a2) => HomePage(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: const Duration(milliseconds: 500)));
    }

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
                Expanded(
                    child: Center(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppLogo.caronApp,
                      filterQuality: FilterQuality.high,
                      scale: 5,
                    ),
                    const SizedBox(height: 72),
                    CustomTextFieldWidget(
                        tamanhoTela: tamanhoTela, valor: "RA"),
                    const SizedBox(height: 24),
                    CustomTextFieldWidget(
                        tamanhoTela: tamanhoTela, valor: "Senha"),
                    TextButton(
                        onPressed: navigateToHome,
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        child: const Text(
                          "Esqueci minha senha",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )),
                    const SizedBox(height: 40),
                    BotaoVermelhoWidget(
                      onPressed: navigateToHome,
                      child: 'Login',
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text("Não é cadastrado?"),
                      TextButton(
                          onPressed: navigateToHome,
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                          child: const Text(
                            "Cadastre-se",
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ))
                    ])
                  ],
                ))),
                Row(
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
                      width: 116,
                      height: 116,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 48,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

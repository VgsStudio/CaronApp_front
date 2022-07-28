import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:caronapp_front/pages/login/cadastro/widgets/cadastro_textfield_widget.dart';
import 'package:caronapp_front/pages/login/login/login_page.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botaoVermelho_widget.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key}) : super(key: key);

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

    navigateToLogin() async {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (c, a1, a2) => LoginPage(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: const Duration(milliseconds: 500)));
    }

    var tamanhoTela = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            elevation: 0,
            toolbarHeight: 56,
            backgroundColor: Colors.transparent,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: IconButton(
                      iconSize: 4,
                      padding: EdgeInsets.zero,
                      onPressed: navigateToLogin,
                      icon: const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 32,
                        ),
                      )),
                ),
              ],
            )),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:
              const BoxDecoration(gradient: AppColors.backgroundGradient),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),
                Row(
                  children: const [
                    CadastroTextFieldWidget(
                        widthMult: 0.3, valor: "Primeiro nome"),
                    SizedBox(
                      width: 24,
                    ),
                    CadastroTextFieldWidget(
                        widthMult: 0.55, valor: "Sobrenome"),
                  ],
                ),
                //TODO: nome social (Checkbox e TextField)
                const CadastroTextFieldWidget(widthMult: 0.9, valor: "E-mail"),
                const CadastroTextFieldWidget(
                    widthMult: 0.9, valor: "Telefone"),
                const CadastroTextFieldWidget(widthMult: 0.9, valor: "RA"),
                const CadastroTextFieldWidget(widthMult: 0.9, valor: "Senha"),
                const CadastroTextFieldWidget(
                    widthMult: 0.5, valor: "Data de Nascimento"),
                Row(
                  children: const [
                    CadastroTextFieldWidget(widthMult: 0.6, valor: "Curso"),
                    //TODO: DropdownButton
                    SizedBox(width: 24),
                    CadastroTextFieldWidget(widthMult: 0.2, valor: "Série"),
                  ],
                ),
                const CadastroTextFieldWidget(widthMult: 0.4, valor: "Gênero"),
                //TODO: termos (TextField, Text e TextButton)
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: BotaoVermelhoWidget(
                    child: "Cadastrar-se",
                    onPressed: navigateToHome,
                  ),
                ),
                Spacer(),
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
                )
              ],
            ),
          ),
        ));
  }
}

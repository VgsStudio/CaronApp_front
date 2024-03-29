import 'package:caronapp_front/pages/login/cadastro/cadastro_page.dart';
import 'package:caronapp_front/pages/login/cadastro/widgets/cadastro_textfield_widget.dart';
import 'package:caronapp_front/pages/login/cadastro/widgets/definir_tipo_textfield_enum.dart';
import 'package:caronapp_front/pages/login/login/login_page.dart';
import 'package:caronapp_front/pages/login/widgets/bottom_logos_widget.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botao_vermelho_widget.dart';
import 'package:flutter/material.dart';

class ResetSenhaPage extends StatefulWidget {
  const ResetSenhaPage({Key? key}) : super(key: key);

  @override
  State<ResetSenhaPage> createState() => _ResetSenhaPageState();
}

class _ResetSenhaPageState extends State<ResetSenhaPage> {
  final formKey = GlobalKey<FormState>();
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

    navigateToCadastro() async {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (c, a1, a2) => const CadastroPage(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: const Duration(milliseconds: 500)));
    }

    return Form(
      key: formKey,
      child: Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  const Text(
                    "Esqueci minha senha",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 42,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Digite seu e-mail",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      CadastroTextFieldWidget(
                        tipoCampoTextoEnum: TipoCampoTextoEnum.EMAIL,
                        valor: "E-mail",
                        prefixIcon: Icon(Icons.email_outlined),
                      )
                    ],
                  ),
                  BotaoVermelhoWidget(
                      child: "Continuar",
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formKey.currentState!.validate()) {
                          navigateToLogin();
                        }
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Não é cadastrado?"),
                          TextButton(
                              onPressed: navigateToCadastro,
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              child: const Text(
                                "Cadastre-se",
                                style: TextStyle(
                                    decoration: TextDecoration.underline),
                              ))
                        ]),
                  ),
                  const Spacer(),
                  const BottomLogosWidget()
                ],
              ),
            ),
          )),
    );
  }
}

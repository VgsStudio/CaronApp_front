import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:caronapp_front/pages/login/cadastro/widgets/cadastro_textfield_widget.dart';
import 'package:caronapp_front/pages/login/login/login_page.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botaoVermelho_widget.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  List<String> cursos = [
    'Administração',
    'Ciência da Computação',
    'Design',
    'Engenharia Civil',
    'Engenharia de Alimentos',
    'Engenharia de Computação',
    'Engenharia de Controle e Automação',
    'Engenharia de Produção',
    'Engenharia Elétrica',
    'Engenharia Eletrônica',
    'Engenharia Mecânica',
    'Engenharia Química',
    'Sistemas de Informação'
  ];
  List<String> anos = ['1°', '2°', '3°', '4°', '5°'];
  String? selectedAno = '1°';
  String? selectedCurso = 'Administração';
  bool nomeSocial = false;
  DateTime date = DateTime(2022, 07, 28);
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
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text("Nome Social",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Checkbox(
                        activeColor: AppColors.vermelhoGrena,
                        checkColor: AppColors.brancosSub,
                        value: nomeSocial,
                        onChanged: (bool? checked) {
                          setState(() {
                            nomeSocial = !nomeSocial;
                          });
                          ;
                        },
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Visibility(
                          visible: nomeSocial,
                          child: CadastroTextFieldWidget(
                            valor: "Nome Social",
                            widthMult: 0.6,
                            margin: 0,
                          ))
                    ],
                  ),
                ),
                const CadastroTextFieldWidget(widthMult: 0.9, valor: "E-mail"),
                const CadastroTextFieldWidget(
                    widthMult: 0.9, valor: "Telefone"),
                const CadastroTextFieldWidget(widthMult: 0.9, valor: "RA"),
                const CadastroTextFieldWidget(widthMult: 0.9, valor: "Senha"),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Text("Data de nascimento",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.cinzaEscuro)),
                          onPressed: () async {
                            showDatePicker(
                                context: context,
                                initialDate: date,
                                firstDate: DateTime(1990, 01, 01),
                                lastDate: DateTime(2022, 12, 31));
                          },
                          child: Icon(
                            Icons.calendar_today,
                            color: AppColors.cinzaClaro,
                          )),
                    ],
                  ),
                ),
                Row(children: [
                  //TODO: DropdownButton
                  Text('Curso',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                      menuMaxHeight: 150,
                      value: selectedCurso,
                      items:
                          cursos.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCurso = newValue!;
                        });
                      })
                ]),

                Row(
                  children: [
                    Text('Ano',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        menuMaxHeight: 150,
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.brancosSub,
                            fontWeight: FontWeight.bold),
                        value: selectedAno,
                        items:
                            anos.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedAno = newValue!;
                          });
                        }),
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

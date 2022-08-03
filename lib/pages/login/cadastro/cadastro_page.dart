import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:caronapp_front/pages/login/cadastro/widgets/cadastro_textfield_widget.dart';
import 'package:caronapp_front/pages/login/cadastro/widgets/definir_tipo_textfield_enum.dart';
import 'package:caronapp_front/pages/login/login/login_page.dart';
import 'package:caronapp_front/pages/login/widgets/bottom_logos_widget.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botaoVermelho_widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
  List<String> generos = ['Masculino', 'Feminino', 'Não-binário', 'Outro'];
  String? selectedGenero = null;
  String? selectedAno = null;
  String? selectedCurso = null;
  bool nomeSocial = false;
  DateTime date = DateTime(2022, 07, 28);
  final formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
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
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: const [
                      CadastroTextFieldWidget(
                          widthMult: 0.3,
                          valor: "Nome",
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.cinzaClaro,
                          )),
                      SizedBox(
                        width: 24,
                      ),
                      CadastroTextFieldWidget(
                          widthMult: 0.55,
                          valor: "Sobrenome",
                          maxLength: 60,
                          prefixIcon: Icon(
                            Icons.person,
                            color: AppColors.cinzaClaro,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 8,
                      ),
                      Text("Nome Social",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 8,
                      ),
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
                        width: 24,
                      ),
                      CadastroTextFieldWidget(
                        isEnabled: nomeSocial,
                        valor: "Nome Social",
                        widthMult: 0.55,
                        margin: 0,
                        prefixIcon: Icon(Icons.person),
                      )
                    ],
                  ),
                  const CadastroTextFieldWidget(
                    widthMult: 0.9,
                    valor: "E-mail",
                    tipoCampoTextoEnum: TipoCampoTextoEnum.EMAIL,
                    maxLength: 150,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: AppColors.cinzaClaro,
                    ),
                  ),
                  CadastroTextFieldWidget(
                    tipoCampoTextoEnum: TipoCampoTextoEnum.TELEFONE,
                    widthMult: 0.9,
                    valor: "Telefone",
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: AppColors.cinzaClaro,
                    ),
                  ),
                  CadastroTextFieldWidget(
                    tipoCampoTextoEnum: TipoCampoTextoEnum.RA,
                    widthMult: 0.9,
                    valor: "RA",
                    prefixIcon: const Icon(
                      Icons.school_sharp,
                      color: AppColors.cinzaClaro,
                    ),
                  ),
                  const CadastroTextFieldWidget(
                      widthMult: 0.9,
                      maxLength: 150,
                      valor: "Senha",
                      tipoCampoTextoEnum: TipoCampoTextoEnum.SENHA,
                      isObscure: true,
                      prefixIcon: Icon(
                        Icons.lock,
                        color: AppColors.cinzaClaro,
                      )),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Text("Data de nascimento",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(12)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.cinzaEscuro)),
                          onPressed: () async {
                            DateTime? newDate = await showDatePicker(
                              context: context,
                              initialDate: date,
                              firstDate: DateTime(1990, 01, 01),
                              lastDate: DateTime(2022, 12, 31),
                            );
                            if (newDate == null) return;
                            setState(() {
                              date = newDate;
                            });
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.calendar_today,
                                color: AppColors.cinzaClaro,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${date.day}/${date.month}/${date.year}',
                                style: TextStyle(
                                  color: AppColors.cinzaClaro,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    Text('Curso',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        menuMaxHeight: 150,
                        hint: Text('Selecione seu curso'),
                        value: selectedCurso,
                        items: cursos
                            .map<DropdownMenuItem<String>>((String value) {
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
                        width: 35,
                      ),
                      DropdownButton(
                          menuMaxHeight: 150,
                          hint: Text('Selecione o ano'),
                          value: selectedAno,
                          items: anos
                              .map<DropdownMenuItem<String>>((String value) {
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
                  Row(
                    children: [
                      Text('Gênero',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                          menuMaxHeight: 150,
                          hint: Text('Selecione seu gênero'),
                          value: selectedGenero,
                          items: generos
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGenero = newValue!;
                            });
                          }),
                    ],
                  ),
                  //TODO: termos (TextField, Text e TextButton)
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: BotaoVermelhoWidget(
                      child: "Cadastrar-se",
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (formKey.currentState!.validate()) {
                          navigateToHome();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 96,
                  ),
                  BottomLogosWidget()
                ],
              ),
            ),
          )),
    );
  }
}

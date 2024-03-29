import 'package:caronapp_front/pages/home/home_page.dart';
import 'package:caronapp_front/pages/login/cadastro/widgets/cadastro_textfield_widget.dart';
import 'package:caronapp_front/pages/login/cadastro/widgets/definir_tipo_textfield_enum.dart';
import 'package:caronapp_front/pages/login/login/login_page.dart';
import 'package:caronapp_front/pages/login/widgets/bottom_logos_widget.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botao_vermelho_widget.dart';
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
  List<String> anos = ['1°', '2°', '3°', '4°', '5°', '6°'];
  List<String> generos = ['Masculino', 'Feminino', 'Não-binário', 'Outro'];
  String? selectedGenero;
  String? selectedAno;
  String? selectedCurso;
  bool nomeSocial = false;
  DateTime date = DateTime.now();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    navigateToHome() async {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (c, a1, a2) => const HomePage(),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: const Duration(milliseconds: 500)));
    }

    navigateToLogin() async {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (c, a1, a2) => const LoginPage(),
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
              child: ListView(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        flex: 2,
                        child: CadastroTextFieldWidget(
                            valor: "Nome",
                            prefixIcon: Icon(
                              Icons.person,
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: CadastroTextFieldWidget(
                            valor: "Sobrenome",
                            maxLength: 100,
                            prefixIcon: Icon(
                              Icons.person,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Nome Social",
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
                              },
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: CadastroTextFieldWidget(
                          isEnabled: nomeSocial,
                          valor: "Nome Social",
                          margin: 0,
                          prefixIcon: const Icon(Icons.person),
                        ),
                      )
                    ],
                  ),
                  const CadastroTextFieldWidget(
                    valor: "E-mail",
                    tipoCampoTextoEnum: TipoCampoTextoEnum.EMAIL,
                    maxLength: 150,
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    ),
                  ),
                  const CadastroTextFieldWidget(
                    tipoCampoTextoEnum: TipoCampoTextoEnum.TELEFONE,
                    valor: "Telefone",
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                  ),
                  const CadastroTextFieldWidget(
                    tipoCampoTextoEnum: TipoCampoTextoEnum.RA,
                    valor: "RA",
                    prefixIcon: Icon(
                      Icons.school_sharp,
                    ),
                  ),
                  const CadastroTextFieldWidget(
                      maxLength: 150,
                      valor: "Senha",
                      tipoCampoTextoEnum: TipoCampoTextoEnum.SENHA,
                      isObscure: true,
                      prefixIcon: Icon(
                        Icons.lock,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Expanded(
                          flex: 2,
                          child: Text("Data de nascimento",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.all(12)),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
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
                                const Icon(Icons.calendar_today,
                                    color: AppColors.cinzaClaro),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${date.day}/${date.month}/${date.year}',
                                  style: const TextStyle(
                                    color: AppColors.cinzaClaro,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 8,
                    ),
                    const Text('Curso',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                        menuMaxHeight: 150,
                        hint: const Text('Selecione seu curso'),
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
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Ano',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 35,
                      ),
                      DropdownButton(
                          menuMaxHeight: 150,
                          hint: const Text('Selecione o ano'),
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
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Gênero',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton(
                          menuMaxHeight: 150,
                          hint: const Text('Selecione seu gênero'),
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
                  const SizedBox(
                    height: 96,
                  ),
                  const BottomLogosWidget()
                ],
              ),
            ),
          )),
    );
  }
}

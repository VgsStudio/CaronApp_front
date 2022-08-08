import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/app_bar_transparente_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

import 'widget/support_opcao_widget.dart';

class SupportProfilePage extends StatelessWidget {
  final Motorista motorista;

  const SupportProfilePage({Key? key, required this.motorista})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: AppBarTransparenteWidget()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(),
          Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
                color: AppColors.cinzaEscuro,
                border: Border.all(color: AppColors.brancosSub, width: 3),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.cinzaClaro,
                        borderRadius: BorderRadius.circular(52),
                        border:
                            Border.all(color: AppColors.brancosSub, width: 3),
                      ),
                      child: SvgPicture.string(
                          height: 100,
                          width: 100,
                          multiavatar(motorista.foto, trBackground: true))),
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            '${motorista.nome} ${motorista.sobrenome}',
                            textAlign: TextAlign.center,
                            textScaleFactor: 1.3,
                            style: const TextStyle(
                              color: AppColors.cinzaClaro,
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.verified,
                          color: AppColors.azulClaro,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.05,
                              child: const Icon(Icons.assignment)),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text(
                              motorista.curso,
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.5,
                            ),
                          ),
                        ],
                      ),
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
                    onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                title: const Text('Acionar!'),
                                content: const Text(
                                  'Você tem certeza que quer acionar a polícia?',
                                  textAlign: TextAlign.justify,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancelar'),
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Aceitar'),
                                    child: const Text('Aceitar'),
                                  ),
                                ])))),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          const Text('O que deseja reportar sobre o mostorista?',
              textAlign: TextAlign.center, textScaleFactor: 1.5),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Ocorreu um roubo',
          ),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Ocorreu um acidente',
          ),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Ocorreu uma injúria',
          ),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Foto/Nome não condiz',
          ),
          SupportOpcaoWidget(
            onTap: () {},
            texto: 'Reportar outro problema',
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppLogo.imtQuadrado,
                  filterQuality: FilterQuality.high,
                  width: 96,
                  height: 96,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                Image.asset(
                  AppLogo.dev,
                  filterQuality: FilterQuality.high,
                  width: 88,
                  height: 88,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

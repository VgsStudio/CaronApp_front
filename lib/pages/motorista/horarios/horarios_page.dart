import 'dart:math';
import 'package:caronapp_front/pages/motorista/models/carona/caronas_json.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:username_gen/username_gen.dart';

import 'widgets/opcao_carona_widget.dart';

class HorariosPage extends StatelessWidget {
  HorariosPage({Key? key}) : super(key: key);

  static final _random = Random();
  final username = UsernameGen().generate();
  static final nota = _random.nextInt(5) + 1;
  static final idade = _random.nextInt(23) + 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
                iconSize: 4,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                )),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
            child: ListView(children: [
              Text(
                "Ter., 2 de agosto",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: caronaList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    child: OpcaoCaronaWidget(
                      horario: caronaList[index].data,
                      qntPassageiros: caronaList[index].qntPassageiros,
                      motorista: caronaList[index].motorista,
                      local: caronaList[index].local,
                    ),
                  );
                },
              ),
            ])));
  }
}

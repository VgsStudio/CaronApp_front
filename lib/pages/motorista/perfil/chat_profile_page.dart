import 'dart:math';
import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/pages/motorista/perfil/driver_profile_page.dart';
import 'package:caronapp_front/pages/motorista/perfil/support_profile_page.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

class ChatProfilePage extends StatelessWidget {
  static final _random = Random();
  final Motorista motorista;

  ChatProfilePage({
    Key? key,
    required this.motorista,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: AppColors.cinzaClaro,
                  borderRadius: BorderRadius.circular(52),
                  border: Border.all(color: AppColors.brancosSub, width: 3),
                ),
                child: SvgPicture.string(
                    height: 50,
                    width: 50,
                    multiavatar(motorista.foto, trBackground: true))),
            const Padding(padding: EdgeInsets.only(right: 10)),
            Text('${motorista.nome}     |     '),
            const Text('Online'),
            const Padding(padding: EdgeInsets.only(right: 10)),
            const Icon(
              Icons.circle,
              color: AppColors.verdeClaro,
            )
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.more_vert),
              tooltip: 'Denunciar!',
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
      bottomSheet: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: MediaQuery.of(context).size.width / 1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.cinzaClaro,
              border: Border.all(color: AppColors.brancosSub)),
          child: const Text(
            'Digite aqui!',
            textScaleFactor: 2.5,
            textAlign: TextAlign.start,
          ),
        )
      ]),
    );
  }
}

import 'dart:math';
import 'package:caronapp_front/pages/motorista/perfil/driver_profile_page.dart';
import 'package:caronapp_front/pages/motorista/perfil/support_profile_page.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';
import 'package:username_gen/username_gen.dart';

class ChatProfilePage extends StatelessWidget {
  ChatProfilePage({Key? key}) : super(key: key);

  static final _random = Random();
  static final _nota = _random.nextInt(5) + 1;
  static final _idade = _random.nextInt(23) + 18;
  final username = UsernameGen().generate();

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
                    multiavatar(username, trBackground: true))),
            const Padding(padding: EdgeInsets.only(right: 10)),
            Text('$username     |     '),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportProfilePage()),
                );
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

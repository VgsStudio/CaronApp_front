import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

class ChatProfilePage extends StatelessWidget {
  final Motorista motorista;

  const ChatProfilePage({
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
                      height: 45,
                      width: 45,
                      multiavatar(motorista.foto, trBackground: true))),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Text(
                    '${motorista.nome} | Online',
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
                child: const Icon(
                  Icons.circle,
                  color: AppColors.verdeClaro,
                ),
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
        bottomSheet: TextField(
          decoration: InputDecoration(
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              labelText: 'Digite aqui!'),
          controller: TextEditingController(),
          onSubmitted: null,
        ));
  }
}

import 'package:caronapp_front/models/usuario/Usuario.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

class ProfileHeaderDrawerWidget extends StatelessWidget {
  final Usuario info;

  const ProfileHeaderDrawerWidget({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 16),
            // foto
            decoration: BoxDecoration(
                color: AppColors.cinzaMaisClaro,
                borderRadius: BorderRadius.circular(52)),
            child: SvgPicture.string(
                height: 104,
                width: 104,
                multiavatar(info.foto, trBackground: true))),
        SizedBox(
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 2,
                color: AppColors.brancosSub,
              ),
              Text(
                info.nome,
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              Text(
                "${info.idade} anos",
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              Container(
                width: double.infinity,
                height: 2,
                color: AppColors.brancosSub,
              ),
            ],
          ),
        )
      ],
    );
  }
}

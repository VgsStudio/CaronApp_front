import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class ButtomHomeScreenWidget extends StatelessWidget {
  final IconData icone;
  final String text;
  final void Function()? onTap;

  const ButtomHomeScreenWidget({
    Key? key,
    required this.icone,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: tamanhoTela.width * 0.2,
            height: tamanhoTela.width * 0.1,
            decoration: BoxDecoration(
                color: AppColors.cinzaEscuro,
                borderRadius: BorderRadius.circular(16)),
            child: Icon(
              icone,
              size: 32,
            ),
          ),
          Text(text),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}

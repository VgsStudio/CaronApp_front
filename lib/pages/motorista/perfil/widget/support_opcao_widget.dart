import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SupportOpcaoWidget extends StatelessWidget {
  final String texto;
  final Function() onTap;

  const SupportOpcaoWidget({
    Key? key,
    required this.texto,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width / 1.9,
        height: MediaQuery.of(context).size.height / 30,
        decoration: BoxDecoration(
            color: AppColors.cinzaClaro,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.brancosSub)),
        child: Text(texto, textAlign: TextAlign.center, textScaleFactor: 1.2),
      ),
    );
  }
}

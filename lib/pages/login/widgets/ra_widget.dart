import 'package:flutter/material.dart';

import '../../../shared/themes/app_colors.dart';

class RaWidget extends StatelessWidget {
  final tamanhoTela;
  const RaWidget({Key? key, required this.tamanhoTela}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "RA:",
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          width: tamanhoTela.width / 2,
          child: TextField(
            style: TextStyle(fontSize: 16),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                filled: true,
                fillColor: AppColors.cinzaEscuro),
          ),
        ),
      ],
    );
  }
}

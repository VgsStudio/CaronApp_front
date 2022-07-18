import 'package:flutter/material.dart';

import '../../../shared/themes/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final tamanhoTela;
  final String valor;

  const CustomTextFieldWidget(
      {Key? key, required this.tamanhoTela, required this.valor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          valor,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(
          width: 240,
          height: 40,
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

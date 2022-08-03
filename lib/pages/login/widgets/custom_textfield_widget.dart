import 'package:flutter/material.dart';

import '../../../shared/themes/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final tamanhoTela;
  final String valor;
  final bool isObscure;
  final onChanged;

  const CustomTextFieldWidget(
      {Key? key,
      this.tamanhoTela,
      required this.valor,
      this.isObscure = false,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 240,
          height: 40,
          child: TextField(
            onChanged: onChanged,
            obscureText: isObscure,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 12),
                hintText: valor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
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

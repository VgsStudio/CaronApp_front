import 'package:caronapp_front/pages/login/cadastro/widgets/definir_tipo_textfield_enum.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../shared/themes/app_colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final tamanhoTela;
  final String valor;
  final bool isObscure;
  final onChanged;
  final TipoCampoTextoEnum tipoCampoTextoEnum;

  const CustomTextFieldWidget(
      {Key? key,
      this.tamanhoTela,
      required this.valor,
      this.isObscure = false,
      this.onChanged,
      this.tipoCampoTextoEnum = TipoCampoTextoEnum.TEXTO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nullMask = MaskTextInputFormatter();
    var maskFormatter = tipoCampoTextoEnum == TipoCampoTextoEnum.RA
        ? MaskTextInputFormatter(
            mask: '##.#####-#',
            filter: {"#": RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy)
        : nullMask;
    var keyboardType = tipoCampoTextoEnum == TipoCampoTextoEnum.RA
        ? TextInputType.number
        : TextInputType.text;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 240,
          height: 40,
          child: TextField(
            inputFormatters: [maskFormatter],
            keyboardType: keyboardType,
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

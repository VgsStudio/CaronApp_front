import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RATextFieldWidget extends StatelessWidget {
  final double widthMult;
  final String valor;
  final double margin;
  final Icon prefixIcon;
  final bool isEnabled;
  final bool isObscure;

  RATextFieldWidget(
      {Key? key,
      required this.valor,
      required this.widthMult,
      this.margin = 12,
      this.prefixIcon = const Icon(
        Icons.error,
        color: AppColors.cinzaClaro,
      ),
      this.isEnabled = true,
      this.isObscure = false})
      : super(key: key);

  var maskFormatter = MaskTextInputFormatter(
      mask: '##.#####-#',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: tamanhoTela.width * widthMult,
            height: 40,
            child: TextField(
              inputFormatters: [maskFormatter],
              enabled: isEnabled,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              obscureText: isObscure,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  prefixIcon: prefixIcon,
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
                  fillColor: isEnabled
                      ? AppColors.cinzaEscuro
                      : AppColors.cinzaBackground),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CadastroTextFieldWidget extends StatelessWidget {
  final double widthMult;
  final String valor;
  final double margin;

  const CadastroTextFieldWidget(
      {Key? key,
      required this.valor,
      required this.widthMult,
      this.margin = 12})
      : super(key: key);

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
      ),
    );
  }
}

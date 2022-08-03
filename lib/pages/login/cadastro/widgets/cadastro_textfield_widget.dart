import 'package:caronapp_front/pages/login/cadastro/widgets/definir_tipo_textfield_enum.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroTextFieldWidget extends StatelessWidget {
  final double widthMult;
  final String valor;
  final double margin;
  final Icon prefixIcon;
  final bool isEnabled;
  final bool isObscure;
  final int maxLength;
  final TipoCampoTextoEnum tipoCampoTextoEnum;

  const CadastroTextFieldWidget(
      {Key? key,
      required this.valor,
      required this.widthMult,
      this.margin = 12,
      this.prefixIcon = const Icon(
        Icons.error,
        color: AppColors.cinzaClaro,
      ),
      this.isEnabled = true,
      this.isObscure = false,
      this.maxLength = 20,
      this.tipoCampoTextoEnum = TipoCampoTextoEnum.TEXTO})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var validator = tipoCampoTextoEnum == TipoCampoTextoEnum.TEXTO
        ? (value) {
            if (isEnabled) {
              if ((value == null || value.isEmpty)) {
                return 'Campo vazio';
              }
              return null;
            }
          }
        : tipoCampoTextoEnum == TipoCampoTextoEnum.EMAIL
            ? (value) {
                if (isEnabled) {
                  if ((value == null || value.isEmpty)) {
                    return 'Campo vazio';
                  } else if (value.contains('@') == false) {
                    return 'E-mail inválido';
                  }
                  return null;
                }
              }
            : tipoCampoTextoEnum == TipoCampoTextoEnum.RA
                ? (value) {
                    if (isEnabled) {
                      if ((value == null || value.isEmpty)) {
                        return 'Campo vazio';
                      } else if (value.length != 10) {
                        return 'RA Inválido';
                      }
                      return null;
                    }
                  }
                : tipoCampoTextoEnum == TipoCampoTextoEnum.SENHA
                    ? (value) {
                        RegExp regex =
                            RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
                        if (isEnabled) {
                          if ((value == null || value.isEmpty)) {
                            return 'Campo vazio';
                          } else if (!regex.hasMatch(value)) {
                            return 'Senha inválida';
                          }
                          return null;
                        }
                      }
                    : null;
    var nullMask = MaskTextInputFormatter(
        mask:
            '######################################################################################################################################################',
        filter: {"#": RegExp('.*')},
        type: MaskAutoCompletionType.lazy);
    var maskFormatter = tipoCampoTextoEnum == TipoCampoTextoEnum.RA
        ? MaskTextInputFormatter(
            mask: '##.#####-#',
            filter: {"#": RegExp(r'[0-9]')},
            type: MaskAutoCompletionType.lazy)
        : tipoCampoTextoEnum == TipoCampoTextoEnum.TELEFONE
            ? MaskTextInputFormatter(
                mask: '+55 (##) #####-####',
                filter: {"#": RegExp(r'[0-9]')},
                type: MaskAutoCompletionType.lazy)
            : nullMask;
    var tamanhoTela = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: tamanhoTela.width * widthMult,
            height: 40,
            child: TextFormField(
              inputFormatters: [maskFormatter],
              validator: validator,
              maxLength: maxLength,
              enabled: isEnabled,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              obscureText: isObscure,
              style: const TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  counterText: '',
                  errorStyle: TextStyle(fontSize: 0.01),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: AppColors.vermelhoGrena,
                          width: 0.5,
                          style: BorderStyle.solid)),
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

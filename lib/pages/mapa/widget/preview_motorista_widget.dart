import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botao_vermelho_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

class PreviewMotoristaWidget extends StatelessWidget {
  final Motorista motorista;
  final Function()? onTapReturn;
  final Function()? onTapCarona;

  const PreviewMotoristaWidget(
      {Key? key, required this.motorista, this.onTapReturn, this.onTapCarona})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;

    return Container(
      height: tamanhoTela.height * 0.4,
      width: tamanhoTela.width * 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: const BoxDecoration(
        color: AppColors.cinzaEscuro,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        InkWell(
          onTap: onTapReturn,
          child: Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.arrow_back,
                  color: AppColors.cinzaMaisClaro,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Ver outros motoristas",
                  style: TextStyle(
                      color: AppColors.cinzaMaisClaro,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
                color: AppColors.cinzaEscuro,
                borderRadius: BorderRadius.circular(16)),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.cinzaClaro,
                      borderRadius: BorderRadius.circular(44),
                    ),
                    child: SvgPicture.string(
                        height: 80,
                        width: 80,
                        multiavatar(motorista.foto, trBackground: true))),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            motorista.rate.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          const Icon(
                            Icons.star,
                            color: AppColors.brancosSub,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${motorista.idade} anos",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "${motorista.nome} ${motorista.sobrenome}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          const Icon(
                            Icons.verified,
                            color: AppColors.azulClaro,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.assignment),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Text(
                              motorista.curso,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        BotaoVermelhoWidget(
          onPressed: onTapCarona,
          child: "Confirmar Carona",
          fontSize: 24,
          width: null,
        )
      ]),
    );
  }
}

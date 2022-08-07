import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CorridaAndamentoWidget extends StatelessWidget {
  const CorridaAndamentoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    return Container(
      height: tamanhoTela.height * 0.4,
      width: tamanhoTela.width * 0.85,
      decoration: BoxDecoration(
        color: AppColors.cinzaEscuro,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            'Perfeito! Agora aguarde o motorista no ponto de carona.',
            style: TextStyle(
              fontSize: 20.1,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(child: SpinKitRing(color: AppColors.vermelhoGrena, size: 70)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Corrida em andamento',
              style: TextStyle(
                fontSize: 20.1,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ]),
    );
  }
}

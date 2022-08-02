import 'package:caronapp_front/shared/logo/app_logos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomLogosWidget extends StatelessWidget {
  const BottomLogosWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppLogo.imtQuadrado,
          filterQuality: FilterQuality.high,
          width: 96,
          height: 96,
        ),
        SizedBox(
          width: tamanhoTela.width * 0.1,
        ),
        Image.asset(
          AppLogo.dev,
          filterQuality: FilterQuality.high,
          width: 116,
          height: 116,
        ),
      ],
    );
  }
}

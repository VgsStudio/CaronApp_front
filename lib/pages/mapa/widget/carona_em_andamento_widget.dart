import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CaronaAndamentoWidget extends StatelessWidget {
  const CaronaAndamentoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 300,
      width: 300,
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}

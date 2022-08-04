import 'package:caronapp_front/pages/mapa/widget/carona_em_andamento_widget.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              alignment: Alignment.bottomCenter, child: CaronaAndamentoWidget())
        ],
      ),
    );
  }
}

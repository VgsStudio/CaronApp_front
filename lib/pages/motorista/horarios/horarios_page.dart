import 'package:caronapp_front/pages/mapa/entities.dart/Local.dart';
import 'package:caronapp_front/pages/mapa/entities.dart/locais_json.dart';
import 'package:caronapp_front/pages/motorista/models/carona/caronas_json.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'widgets/opcao_carona_widget.dart';

class HorariosPage extends StatefulWidget {
  final Local localRequisitado;

  HorariosPage({Key? key, required this.localRequisitado}) : super(key: key);

  @override
  State<HorariosPage> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  late var caronas = caronaList;

  @override
  void initState() {
    super.initState();
    iniciaListaLocais(widget.localRequisitado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            child: IconButton(
                iconSize: 4,
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                )),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: AppColors.backgroundGradient),
            child: Column(children: [
              SizedBox(height: 64),
              Text(
                "Ter., 2 de agosto",
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              caronas.length > 0
                  ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: caronas.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            child: OpcaoCaronaWidget(
                              horario: caronas[index].data,
                              qntPassageiros: caronas[index].qntPassageiros,
                              motorista: caronas[index].motorista,
                              local: caronas[index].local,
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "No momento, não há caronas disponíveis para esta região!",
                            style: TextStyle(fontSize: 36),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    )),
            ])));
  }

  void iniciaListaLocais(Local local) {
    final caronas = caronaList.where((carona) {
      final titleLower = carona.local.title.toLowerCase();
      final searchLower = local.title.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.caronas = caronas;
    });
  }
}

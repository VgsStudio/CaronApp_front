import 'package:caronapp_front/pages/mapa/entities.dart/Local.dart';
import 'package:caronapp_front/pages/motorista/models/carona/caronas_json.dart';
import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/app_bar_transparente_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/opcao_carona_widget.dart';

class HorariosPage extends StatefulWidget {
  final Local localRequisitado;
  final Function(Motorista) onTap;

  const HorariosPage(
      {Key? key, required this.localRequisitado, required this.onTap})
      : super(key: key);

  @override
  State<HorariosPage> createState() => _HorariosPageState();
}

class _HorariosPageState extends State<HorariosPage> {
  late var caronas = caronaList;
  DateTime diaAtual = DateTime.now();

  List<String> diasDaSemana = [
    "Seg.",
    "Ter.",
    "Qua.",
    "Qui.",
    "Sex.",
    "Sáb.",
    "Dom."
  ];

  List<String> meses = [
    'janeiro',
    'fevereiro',
    'março',
    'abril',
    'maio',
    'junho',
    'julho',
    'agosto',
    'setembro',
    'outubro',
    'novembro',
    'dezembro'
  ];

  @override
  void initState() {
    super.initState();
    iniciaListaLocais(widget.localRequisitado);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: AppBarTransparenteWidget()),
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration:
                const BoxDecoration(gradient: AppColors.backgroundGradient),
            child: Column(children: [
              const SizedBox(height: 40),
              Text(
                "${diasDaSemana[diaAtual.weekday - 1]}, ${diaAtual.day} de ${meses[diaAtual.month - 1]}",
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              caronas.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: caronas.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Align(
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                widget.onTap(caronas[index].motorista);
                              },
                              child: OpcaoCaronaWidget(
                                horario: caronas[index].data,
                                qntPassageiros: caronas[index].qntPassageiros,
                                motorista: caronas[index].motorista,
                                local: caronas[index].local,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Center(
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Flexible(
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

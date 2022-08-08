import 'package:caronapp_front/pages/final_corrida/avalie_motorista_page.dart';
import 'package:caronapp_front/pages/mapa/appbar_map_widget.dart';
import 'package:caronapp_front/pages/mapa/entities.dart/locais_json.dart';
import 'package:caronapp_front/pages/mapa/widget/opcoes_widget.dart';
import 'package:caronapp_front/pages/mapa/widget/preview_motorista_widget.dart';
import 'package:caronapp_front/pages/motorista/horarios/horarios_page.dart';
import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botao_vermelho_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'widget/corrida_andamento_widget.dart';

class MapaPage extends StatefulWidget {
  final int? buttonOption;
  final bool? focarNoTextForm;

  const MapaPage(
      {Key? key, this.buttonOption = -1, this.focarNoTextForm = false})
      : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.focarNoTextForm != null) {
      focusNode.requestFocus();
    }
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  var controllerSearchField = TextEditingController();
  late var locais = locaisList;
  String query = '';

  late GoogleMapController mapController;
  Set<Marker> markers = <Marker>{};
  bool isOpcoesOpen = false;
  int index = -1;

  bool isMotoristaChoosen = false;
  late Motorista motoristaEscolhido;
  bool isCaronaStarted = false;

  // DADOS MOCKADOS NESSA STRING
  var polyLinePontis;

  double latMaua = -23.6478784;
  double longMaua = -46.5742805;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    LatLng position = LatLng(latMaua, longMaua);
    final Marker mauaMarker = Marker(
        markerId: const MarkerId("MAUÁ"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: position,
        infoWindow: const InfoWindow(
            title: "Instituto Mauá de Tecnologia",
            snippet: "São Caetano do Sul/Brasil"));

    setState(() {
      markers.add(mauaMarker);
    });

    if (widget.buttonOption != null) {
      _navigateTo(widget.buttonOption);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(136),
          child: AppBarMapWidget(
            focusNode: focusNode,
            controller: controllerSearchField,
            onChanged: searchLocal,
            trocarBooleano: trocarBooleano,
            fullfield: _navigateTo,
            valor: 'Para onde deseja ir?',
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
                markers: markers,
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: LatLng(latMaua, longMaua), zoom: 15),
                polylines: {
                  if (polyLinePontis != null)
                    Polyline(
                        polylineId: const PolylineId("ID"),
                        color: AppColors.vermelhoGrena,
                        width: 5,
                        points: (polyLinePontis as List)
                            .map((e) => LatLng(e.latitude, e.longitude))
                            .toList())
                }),
            OpcoesWidget(
              locais: locais,
              isOpcoesOpen: isOpcoesOpen,
              choose: _navigateTo,
            ),
            index != -1 && !isOpcoesOpen
                ? Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 32),
                    child: BotaoVermelhoWidget(
                      width: null,
                      child: "Procurar caronas",
                      onPressed: mostrarCaronas,
                    ),
                  )
                : const SizedBox.shrink(),
            isMotoristaChoosen
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: PreviewMotoristaWidget(
                      onTapCarona: iniciaCarona,
                      onTapReturn: mostrarCaronas,
                      motorista: motoristaEscolhido,
                    ),
                  )
                : const SizedBox.shrink(),
            isCaronaStarted
                ? const Align(
                    alignment: Alignment.bottomCenter,
                    child: CorridaAndamentoWidget())
                : const SizedBox.shrink(),
          ],
        ));
  }

  void mostrarCaronas() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => HorariosPage(
                localRequisitado: locaisList[index],
                onTap: escolheMotorista,
              )),
    );
  }

  // Local Mockado
  void _navigateTo(op) async {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      index = op;
      isOpcoesOpen = false;
    });

    var local = locais[index];
    controllerSearchField.text = local.title;

    double lat = local.lat;
    double long = local.long;

    LatLng position = LatLng(lat, long);

    final Marker marker = Marker(
        markerId: MarkerId(local.markerId),
        position: position,
        icon: BitmapDescriptor.defaultMarkerWithHue(local.hue),
        infoWindow: InfoWindow(title: local.markerId, snippet: local.snippet));

    final bounds = LatLngBounds(
      northeast: LatLng(local.latNortheast, local.longNortheast),
      southwest: LatLng(local.latSouthwest, local.longSouthwest),
    );

    mapController.moveCamera(CameraUpdate.newLatLngBounds(bounds, 0));

    polyLinePontis = PolylinePoints().decodePolyline(local.polyline);

    setState(() {
      if (markers.length > 1) {
        markers.remove(markers.elementAt(1));
      }
      markers.add(marker);
    });
  }

  void trocarBooleano() {
    setState(() {
      isMotoristaChoosen = false;
      isOpcoesOpen = !isOpcoesOpen;
    });
  }

  void searchLocal(String query) {
    final locais = locaisList.where((local) {
      final titleLower = local.title.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.locais = locais;
    });
  }

  void escolheMotorista(Motorista motorista) {
    setState(() {
      isMotoristaChoosen = true;
      motoristaEscolhido = motorista;
    });
  }

  void iniciaCarona() async {
    setState(() {
      isMotoristaChoosen = false;
      isCaronaStarted = true;
    });

    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (c, a1, a2) =>
                  AvalieMotoristaPage(motorista: motoristaEscolhido),
              transitionsBuilder: (c, anim, a2, child) => SlideTransition(
                    position:
                        Tween(begin: const Offset(0, 1.0), end: const Offset(0.0, 0.0))
                            .animate(anim),
                    child: child,
                  )));
    });
  }
}

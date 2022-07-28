import 'dart:convert';

import 'package:caronapp_front/pages/mapa/appbar_map_widget.dart';
import 'package:caronapp_front/pages/mapa/entities.dart/locais_json.dart';
import 'package:caronapp_front/pages/mapa/widget/opcoes_widget.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:caronapp_front/shared/widgets/botaoVermelho_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  var controllerSearchField = TextEditingController();
  late var locais = locaisList;
  String query = '';

  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();
  bool isOpcoesOpen = false;
  int index = -1;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(136),
          child: AppBarMapWidget(
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
                      child: "Procurar motoristas",
                      onPressed: _mostrarMotoristas,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ));
  }

  void _mostrarMotoristas() {
    print(index);
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
}

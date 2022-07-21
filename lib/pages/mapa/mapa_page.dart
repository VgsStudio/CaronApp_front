import 'dart:convert';

import 'package:caronapp_front/pages/login/widgets/custom_textfield_widget.dart';
import 'package:caronapp_front/pages/mapa/appbar_map_widget.dart';
import 'package:caronapp_front/pages/mapa/entities.dart/locais_json.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();
  List _items = [];

  // DADOS MOCKADOS NESSA STRING
  var polyLinePontis;

  double latMaua = -23.6478784;
  double longMaua = -46.5742805;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    LatLng position = LatLng(latMaua, longMaua);
    final Marker mauaMarker = Marker(
        markerId: MarkerId("MAUÁ"),
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(136),
          child: AppBarMapWidget(
            fullfield: _navigateTo,
            valor: 'Para onde deseja ir?',
          ),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
                markers: markers,
                onMapCreated: _onMapCreated,
                initialCameraPosition:
                    CameraPosition(target: LatLng(latMaua, longMaua), zoom: 15),
                polylines: {
                  if (polyLinePontis != null)
                    Polyline(
                        polylineId: PolylineId("ID"),
                        color: AppColors.vermelhoGrena,
                        width: 5,
                        points: (polyLinePontis as List)
                            .map((e) => LatLng(e.latitude, e.longitude))
                            .toList())
                }),
          ],
        ));
  }

  // Local Mockado
  void _navigateTo() async {
    int index = 1;

    var item = Locais.items[0]["locais"][index];

    double lat = item["lat"];
    double long = item["long"];

    LatLng position = LatLng(lat, long);

    final Marker marker = Marker(
        markerId: MarkerId(item["markerId"]),
        position: position,
        icon: BitmapDescriptor.defaultMarkerWithHue(item["hue"]),
        infoWindow:
            InfoWindow(title: item["markerId"], snippet: item["snippet"]));

    final bounds = LatLngBounds(
      northeast: LatLng(item["bounds"]["northeast"]["lat"],
          item["bounds"]["northeast"]["lng"]),
      southwest: LatLng(item["bounds"]["southwest"]["lat"],
          item["bounds"]["southwest"]["lng"]),
    );

    mapController.moveCamera(CameraUpdate.newLatLngBounds(bounds, 0));
    // mapController.moveCamera(CameraUpdate.newLatLng(LatLng(lat, long)));

    polyLinePontis = PolylinePoints().decodePolyline(item["polyline"]);

    setState(() {
      markers.add(marker);
    });
  }
}

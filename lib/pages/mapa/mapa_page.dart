import 'package:caronapp_front/pages/login/widgets/custom_textfield_widget.dart';
import 'package:caronapp_front/pages/mapa/appbar_map_widget.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {
  MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();

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
            fullfield: _toPalmeiras,
            valor: 'Para onde deseja ir?',
          ),
        ),
        body: GoogleMap(
          onCameraMove: (data) {
            // print(data);
          },
          onTap: (position) {
            // print(position);
          },
          markers: markers,
          onMapCreated: _onMapCreated,
          initialCameraPosition:
              CameraPosition(target: LatLng(latMaua, longMaua), zoom: 15),
        ));
  }

  void _toPalmeiras() {
    double lat = -23.5274126;
    double long = -46.6785033;

    LatLng position = LatLng(lat, long);

    final Marker marker = Marker(
        markerId: MarkerId("1234"),
        position: position,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        infoWindow:
            const InfoWindow(title: "Parmeira", snippet: "São Paulo/Brasil"));

    mapController.moveCamera(CameraUpdate.newLatLng(LatLng(lat, long)));

    setState(() {
      markers.add(marker);
    });
  }
}

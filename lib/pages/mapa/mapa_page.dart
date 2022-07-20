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

  double lat = -23.6461376;
  double long = -46.5692067;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: AppBarMapWidget(
            valor: 'Para onde deseja ir?',
          ),
        ),
        body: GoogleMap(
          onCameraMove: (data) {
            print(data);
          },
          onTap: (position) {
            print(position);
          },
          markers: markers,
          onMapCreated: _onMapCreated,
          initialCameraPosition:
              CameraPosition(target: LatLng(lat, long), zoom: 15),
        ));
  }
}

import 'package:flutter/material.dart';

import '../../shared/themes/app_colors.dart';

class AppBarMapWidget extends StatelessWidget {
  final String valor;

  const AppBarMapWidget({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 10,
      toolbarHeight: 160,
      backgroundColor: AppColors.cinzaEscuro,
      title: Row(
        children: [
          ImageIcon(
            size: 56,
            AssetImage("assets/images/where to.png"),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 296,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.preto,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Text(
                      "Instituto Mauá de Tecnologia",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.cinzaClaro,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: 296,
                height: 40,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.cinzaClaro,
                  ),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 12),
                      hintText: valor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.preto),
                ),
              ),
            ],
          ),
        ],
      ),
      // title: TextFormField(
      //   onFieldSubmitted: (val) {
      //     // double lat = -23.5274126;
      //     // double long = -46.6785033;

      //     // LatLng position = LatLng(lat, long);
      //     // mapController.moveCamera(CameraUpdate.newLatLng(position));
      //     // final Marker marker = Marker(
      //     //     markerId: MarkerId("1234"),
      //     //     position: position,
      //     //     infoWindow: const InfoWindow(
      //     //         title: "Parmeira", snippet: "São Paulo/Brasil"));

      //     // setState(() {
      //     //   markers.add(marker);
      //     // });
      //   },
      // ),
      leading: Column(
        children: [
          IconButton(
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
        ],
      ),
    );
  }
}

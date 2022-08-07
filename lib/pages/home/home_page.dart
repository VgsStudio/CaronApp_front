import 'package:caronapp_front/pages/home/widgets/button_home_screen_widget.dart';
import 'package:caronapp_front/pages/home/widgets/home_locais_widget.dart';
import 'package:caronapp_front/pages/mapa/entities.dart/locais_json.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../shared/logo/app_logos.dart';
import '../mapa/mapa_page.dart';
import 'widgets/drawer_home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _navigateToMapa([int? op, bool? focarNoTextForm]) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (c, a1, a2) => MapaPage(
            focarNoTextForm: focarNoTextForm,
            buttonOption: op,
          ),
        ));
  }

  late GoogleMapController mapController;
  Set<Marker> markers = Set<Marker>();
  bool isOpcoesOpen = false;
  int index = -1;

  // DADOS MOCKADOS NESSA STRING

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
    var tamanhoTela = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          size: 32,
          color: AppColors.vermelhoGrena,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: DrawerHomePageWidget(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 48),
        decoration: const BoxDecoration(color: AppColors.pretoSub),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              // Logo Caronapp
              AppLogo.caronApp,
              filterQuality: FilterQuality.high,
              scale: 5,
            ),
            Stack(
              children: [
                Container(
                  // Mapa
                  clipBehavior: Clip.hardEdge,
                  width: tamanhoTela.width * 0.8,
                  height: tamanhoTela.height * 0.2,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color: AppColors.cinzaEscuro,
                      borderRadius: BorderRadius.circular(16)),
                  child: GoogleMap(
                    markers: markers,
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                        target: LatLng(latMaua, longMaua), zoom: 15),
                  ),
                ),
                GestureDetector(
                  onTap: _navigateToMapa,
                  child: Container(
                    width: tamanhoTela.width * 0.8,
                    height: tamanhoTela.height * 0.2,
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: tamanhoTela.width * 0.8,
                child: TextFormField(
                  readOnly: true,
                  onTap: () {
                    _navigateToMapa(null, true);
                  },
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.cinzaClaro,
                  ),
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.access_time),
                      contentPadding: const EdgeInsets.only(left: 8),
                      hintText: "Para onde deseja ir?",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.cinzaEscuro),
                ),
              ),
            ),
            Column(
                children: List.generate(
                    locaisList.length < 4 ? locaisList.length : 4,
                    (index) => HomeLocaisWidget(
                          local: locaisList[index],
                          choosePlace: _choosePlace,
                          index: index,
                        ))),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ButtomHomeScreenWidget(
                    text: "Agendados", icone: Icons.reply, onTap: () {}),
                ButtomHomeScreenWidget(
                  text: "Recentes",
                  icone: Icons.calendar_today,
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _choosePlace(op) {
    _navigateToMapa(op);
  }
}

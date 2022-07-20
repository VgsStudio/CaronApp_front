import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../shared/themes/app_colors.dart';

class AppBarMapWidget extends StatefulWidget {
  final String valor;
  final fullfield;

  const AppBarMapWidget({
    Key? key,
    required this.valor,
    required this.fullfield,
  }) : super(key: key);

  @override
  State<AppBarMapWidget> createState() => _AppBarMapWidgetState();
}

class _AppBarMapWidgetState extends State<AppBarMapWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 136,
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
                  onFieldSubmitted: (val) {
                    widget.fullfield();
                  },
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.cinzaClaro,
                  ),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 12),
                      hintText: widget.valor,
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
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
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
        ],
      ),
      leadingWidth: 8,
    );
  }
}

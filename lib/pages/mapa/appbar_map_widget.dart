import 'package:flutter/material.dart';
import '../../shared/themes/app_colors.dart';

class AppBarMapWidget extends StatefulWidget {
  final String valor;
  final Function trocarBooleano;
  final Function fullfield;
  final void Function(String) onChanged;
  final controller;
  final focusNode;

  const AppBarMapWidget({
    Key? key,
    required this.valor,
    required this.fullfield,
    required this.trocarBooleano,
    required this.onChanged,
    this.controller = TextEditingController,
    this.focusNode,
  }) : super(key: key);

  @override
  State<AppBarMapWidget> createState() => _AppBarMapWidgetState();
}

class _AppBarMapWidgetState extends State<AppBarMapWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 32,
      automaticallyImplyLeading: false,
      toolbarHeight: 136,
      backgroundColor: AppColors.cinzaEscuro,
      title: Row(
        children: [
          Container(
            width: 8,
            margin: const EdgeInsets.only(right: 8),
            child: ImageIcon(
              size: 56,
              AssetImage("assets/images/where to.png"),
            ),
          ),
          Expanded(
            flex: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.preto,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 12),
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
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  height: 40,
                  child: Focus(
                    focusNode: widget.focusNode,
                    onFocusChange: (opened) {
                      if (opened) {
                        widget.trocarBooleano();
                      }
                    },
                    child: TextFormField(
                      controller: widget.controller,
                      onChanged: widget.onChanged,
                      style: const TextStyle(
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
                ),
              ],
            ),
          ),
        ],
      ),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8),
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
    );
  }
}

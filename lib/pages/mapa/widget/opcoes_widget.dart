import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

import '../entities.dart/Local.dart';

class OpcoesWidget extends StatefulWidget {
  final bool isOpcoesOpen;
  final choose;
  final locais;

  const OpcoesWidget(
      {Key? key,
      required this.isOpcoesOpen,
      required this.choose,
      required this.locais})
      : super(key: key);

  @override
  State<OpcoesWidget> createState() => _OpcoesWidgetState();
}

class _OpcoesWidgetState extends State<OpcoesWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.isOpcoesOpen
        ? Scaffold(
            body: ListView.builder(
              itemCount: widget.locais.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 56,
                  margin: const EdgeInsets.symmetric(vertical: 1),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {
                      widget.choose(index);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 8),
                          child: const Icon(
                            Icons.map_sharp,
                            color: AppColors.brancosSub,
                          ),
                        ),
                        Text(
                          widget.locais[index].title,
                          style: const TextStyle(
                              color: AppColors.brancosSub,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        : const SizedBox.shrink();
  }
}

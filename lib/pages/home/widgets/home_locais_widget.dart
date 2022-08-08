import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeLocaisWidget extends StatelessWidget {
  final local;
  final Function choosePlace;
  final int index;

  const HomeLocaisWidget(
      {Key? key,
      required this.local,
      required this.choosePlace,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        choosePlace(index);
      },
      child: SizedBox(
        width: tamanhoTela.width * 0.8,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  // Icone
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: AppColors.cinzaEscuro,
                      borderRadius: BorderRadius.circular(16)),
                  child: Icon(
                    local.icon,
                    size: 32,
                  ),
                ),
                Column(
                  // Endereço
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      local.title,
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.branco,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      local.snippet,
                      style: const TextStyle(color: AppColors.cinzaMaisClaro),
                    ),
                  ],
                ),
                const Spacer(), // Espaço
                const SizedBox(
                    child: Icon(Icons.keyboard_arrow_right_sharp)) // Setiha
              ],
            ),
            const Divider(
              thickness: 3,
            ),
          ],
        ),
      ),
    );
  }
}

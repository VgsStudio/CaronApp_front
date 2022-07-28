import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class HomeLocaisWidget extends StatelessWidget {
  final local;

  const HomeLocaisWidget({Key? key, required this.local}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tamanhoTela = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: tamanhoTela.width * 0.8,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  // Icone
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 8),
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
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColors.branco,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      local.snippet,
                      style: TextStyle(color: AppColors.cinzaMaisClaro),
                    ),
                  ],
                ),
                Spacer(), // Espaço
                SizedBox(
                    child: Icon(Icons.keyboard_arrow_right_sharp)) // Setiha
              ],
            ),
            Divider(
              thickness: 3,
            ),
          ],
        ),
      ),
    );
  }
}

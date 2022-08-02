import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DrawerMenuOptionWidget extends StatelessWidget {
  final String option;
  final void Function()? onTap;

  const DrawerMenuOptionWidget({Key? key, required this.option, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Divider(
              thickness: 2,
              color: AppColors.cinzaMaisClaro,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  option,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(child: Icon(Icons.keyboard_arrow_right_sharp))
              ],
            ),
            Divider(
              thickness: 2,
              color: AppColors.cinzaMaisClaro,
            ),
          ],
        ),
      ),
    ));
  }
}

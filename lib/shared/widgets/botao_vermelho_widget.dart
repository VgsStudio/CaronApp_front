import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BotaoVermelhoWidget extends StatelessWidget {
  final void Function()? onPressed;
  final double fontSize;
  final String child;
  final double? width;

  const BotaoVermelhoWidget(
      {Key? key,
      this.onPressed,
      required this.child,
      this.width = 176,
      this.fontSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // se Width for igual a null, o botão não possui constraints
      height: 40,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(AppColors.vermelhoGrena)),
          child: Text(
            child,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: fontSize),
          )),
    );
  }
}

import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BotaoVermelhoWidget extends StatelessWidget {
  final onPressed;
  final String child;

  const BotaoVermelhoWidget({Key? key, this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 176,
      height: 40,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            child,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(AppColors.vermelhoGrena))),
    );
  }
}

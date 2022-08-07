import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OpcaoWidgetGorjeta extends StatelessWidget {
  final int preco;
  const OpcaoWidgetGorjeta({Key? key, required this.preco}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          color: AppColors.vermelhoGrena,
          borderRadius: BorderRadius.circular(30)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("R\$",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.brancosSub,
                  fontSize: 12,
                )),
            SizedBox(
              width: 4,
            ),
            Text("$preco",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.brancosSub,
                  fontSize: 20,
                )),
          ]),
    );
  }
}

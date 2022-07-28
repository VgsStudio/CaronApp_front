import 'package:flutter/material.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';

class driver_profile extends StatelessWidget {
  const driver_profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Icon(
          Icons.arrow_circle_left_outlined,
          color: AppColors.brancosSub,
        )
      ],
    ));
  }
}

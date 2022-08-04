import 'package:flutter/material.dart';

class AppBarTransparenteWidget extends StatelessWidget {
  const AppBarTransparenteWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: IconButton(
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
    );
  }
}

import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Container(
          child: Center(
              child: Text(
            'CaronApp',
            style: TextStyle(color: Colors.yellow),
          )),
        ));
  }
}

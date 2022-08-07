import 'package:flutter/material.dart';

import 'dart:math' as math;

class PlacaMercosulWidget extends StatelessWidget {
  const PlacaMercosulWidget({Key? key, required this.placa}) : super(key: key);

  final String placa;
  @override
  Widget build(BuildContext context) {
    return Container(
      //tudo
      width: 112.5,
      height: 45,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.25),
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(3.75))),
      child: Column(
        children: [
          Container(
            //azul
            width: 112.5,
            height: 11.25,
            color: Color(0xff003399),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      //mercosul
                      width: 3,
                      height: 3,
                      color: Colors.white,
                    ),
                    Text('BRASIL',
                        style: TextStyle(
                            fontSize: 6,
                            color: Colors.white,
                            fontFamily: 'FE-FONT')),
                    Container(
                      height: 7.5,
                      width: 7.5,
                      color: Colors.green,
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: Center(
                          child: Container(
                            width: 3.75,
                            height: 3.75,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
          SizedBox(height: 5.25),
          Text(
            placa,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontFamily: 'FE-FONT'),
          )
        ],
      ),
    );
  }
}

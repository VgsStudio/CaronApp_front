import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';
import 'package:caronapp_front/pages/motorista/perfil/driver_profile_page.dart';
import 'package:caronapp_front/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multiavatar/multiavatar.dart';

class OpcaoCaronaWidget extends StatelessWidget {
  final DateTime horario;
  final Motorista motorista;
  final int qntPassageiros;

  final local;

  const OpcaoCaronaWidget(
      {Key? key,
      required this.horario,
      required this.local,
      required this.motorista,
      required this.qntPassageiros})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 16),
      width: MediaQuery.of(context).size.width / 1.2,
      decoration: BoxDecoration(
          color: AppColors.cinzaEscuro,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Horário de partida: ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 8)),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.vermelhoGrena,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "${horario.hour}:${horario.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 16,
                padding: const EdgeInsets.only(right: 8),
                child: ImageIcon(
                  size: 56,
                  AssetImage("assets/images/where to.png"),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Instituto Mauá de Tecnologia',
                      textScaleFactor: 1.3,
                      style: TextStyle(color: AppColors.cinzaClaro)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    local.title,
                    textScaleFactor: 1.3,
                    style: TextStyle(color: AppColors.cinzaClaro),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DriverProfilePage(
                          motorista: motorista,
                        )),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                      color: AppColors.cinzaClaro,
                      borderRadius: BorderRadius.circular(52),
                      border: Border.all(color: AppColors.brancosSub, width: 3),
                    ),
                    child: SvgPicture.string(
                        height: 70,
                        width: 70,
                        multiavatar(motorista.foto, trBackground: true))),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          "${motorista.nome} ${motorista.sobrenome}",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1.15,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                        child: Icon(
                          Icons.verified,
                          color: AppColors.azulClaro,
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          'Nota: ${motorista.rate.toStringAsFixed(2)}',
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(Icons.star),
                        const Text(
                          '   |   ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('${motorista.idade} anos')
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              child: Text(
                '$qntPassageiros de 3 passageiros',
                textScaleFactor: 1.2,
              )),
        ],
      ),
    );
  }
}

import 'package:caronapp_front/pages/mapa/entities.dart/locais_json.dart';
import 'package:caronapp_front/pages/motorista/models/carona/Carona.dart';

import '../motorista/motorista_json.dart';

final caronaList = <Carona>[
  Carona(DateTime(2022, 8, 2, 11, 30), motoristaList[0], 2, locaisList[0]),
  Carona(DateTime(2022, 8, 2, 13, 30), motoristaList[1], 1, locaisList[0]),
  Carona(DateTime(2022, 8, 2, 17, 00), motoristaList[2], 1, locaisList[0]),
  Carona(DateTime(2022, 8, 2, 20, 00), motoristaList[3], 3, locaisList[0]),
  Carona(DateTime(2022, 8, 2, 9, 40), motoristaList[5], 1, locaisList[1]),
  Carona(DateTime(2022, 8, 2, 17, 20), motoristaList[6], 2, locaisList[1]),
  Carona(DateTime(2022, 8, 2, 21, 30), motoristaList[4], 2, locaisList[1]),
  Carona(DateTime(2022, 8, 2, 10, 40), motoristaList[7], 3, locaisList[2]),
  Carona(DateTime(2022, 8, 2, 18, 10), motoristaList[8], 0, locaisList[2]),
  Carona(DateTime(2022, 8, 2, 11, 10), motoristaList[9], 0, locaisList[3]),
];

import 'package:caronapp_front/pages/mapa/entities.dart/Local.dart';
import 'package:caronapp_front/pages/motorista/models/motorista/Motorista.dart';

class Carona {
  late DateTime data;
  late Motorista motorista;
  late int qntPassageiros;
  late Local local;

  Carona(this.data, this.motorista, this.qntPassageiros, this.local);
}

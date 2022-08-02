import 'package:multiavatar/multiavatar.dart';

class Motorista {
  late String nome;
  late String sobrenome;
  late double rate;
  late String telefone;
  late DateTime nascimento;
  late String curso;
  late String carro;
  late String genero;
  late int ano;
  late int idade;
  late var foto;
  late String bio;
  late int nViagens;

  Motorista(
      this.nome,
      this.sobrenome,
      this.rate,
      this.telefone,
      this.nascimento,
      this.curso,
      this.carro,
      this.genero,
      this.ano,
      this.bio,
      this.nViagens) {
    idade = DateTime.now().year - nascimento.year;
    foto = multiavatar(nome);
  }
}

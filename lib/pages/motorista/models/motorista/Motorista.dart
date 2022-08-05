import 'package:multiavatar/multiavatar.dart';

class Motorista {
  late String nome;
  late String sobrenome;
  late double rate;
  late String telefone;
  late DateTime nascimento;
  late String curso;
  late String carro;
  late String placa;
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
      this.placa,
      this.genero,
      this.ano,
      this.bio,
      this.nViagens) {
    idade = calcularIdade(nascimento);
    foto = multiavatar(nome);
  }
}

calcularIdade(DateTime dataNascimento) {
  DateTime dataAtual = DateTime.now();
  int idade = dataAtual.year - dataNascimento.year;
  if (dataAtual.month <= dataNascimento.month) {
    return idade - 1;
  } else if (dataAtual.month == dataNascimento.month &&
      dataAtual.day < dataNascimento.day) {
    return idade - 1;
  }
  return idade;
}

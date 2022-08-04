import 'package:multiavatar/multiavatar.dart';

class Usuario {
  late String nome;
  late String email;
  late String telefone;
  late String ra;
  late String sobrenome;
  late DateTime nascimento;
  late String curso;
  late String genero;
  late int ano;
  late int idade;
  late var foto;

  Usuario(
    this.nome,
    this.email,
    this.telefone,
    this.ra,
    this.sobrenome,
    this.nascimento,
    this.curso,
    this.genero,
    this.ano,
  ) {
    idade = DateTime.now().year - nascimento.year;
    foto = multiavatar(nome);
  }
}

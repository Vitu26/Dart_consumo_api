import 'dart:convert';

import 'package:dart_api/models/curso.dart';
import 'package:dart_api/models/endereco.dart';
import 'package:dart_api/models/telefone.dart';
// objetos em json se tornam classes em dart

class Aluno {
  String id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  List<Curso> curso;
  Endereco endereco;
  Telefone telefone;

  Aluno({
    required this.id,
    required this.nome,
    this.idade,
    required this.nomeCursos,
    required this.curso,
    required this.endereco,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'idade': idade,
      'nomeCursos': nomeCursos,
      'curso': curso
          .map((curso) => curso.toMap())
          .toList(), //método de conversão de lista em um mapa, array de mapas
      'endereco': endereco.toMap(),
      'telefone': telefone.toMap(),
    };
  }

  factory Aluno.fromMap(Map<String, dynamic> map) {
    return Aluno(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      idade: map['idade'],
      nomeCursos: map['nomeCursos'].cast<String>(),
      curso: map['curso'] != null
          ? List<Curso>.from(
              map['curso'].map<Curso>((curso) => Curso.fromMap(curso)))
          : [],
      // curso: List<Curso>.from(
      //     map['curso'].map<Curso>((curso) => Curso.fromMap(curso))),
      endereco: Endereco.fromMap(map['endereco']),
      telefone: Telefone.fromMap(map['telefone']),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Aluno(id: $id, nome: $nome, nomeCursos: $nomeCursos, endereco: $endereco, curso: $curso)';
  }
}

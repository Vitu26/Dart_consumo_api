// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dart_api/models/cidade.dart';

class Endereco {
  String rua;
  int numero;
  String cep;
  Cidade cidade;

  Endereco({
    required this.rua,
    required this.numero,
    required this.cep,
    required this.cidade,
  });

  Map<String, dynamic> toMap() {
    return {
      'rua': rua,
      'numero': numero,
      'cep': cep,
      'cidade': cidade.toMap(),
    };
  }

  factory Endereco.fromMap(Map<String, dynamic> map) {
    return Endereco(
      cep: map['cep'],
      rua: map['rua'],
      numero: map['numero'],
      cidade: Cidade.fromMap(map['cidade']),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Endereco.fromJson(String json) => Endereco.fromJson(jsonEncode(json));

  @override
  String toString() {
    return 'Endereco(rua: $rua, numero: $numero, cep: $cep, cidade: $cidade)';
  }
}

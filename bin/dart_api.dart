import 'dart:convert';

import 'package:dart_api/dart_api.dart' as dart_api;
import 'package:dart_api/models/telefone.dart';

void main(List<String> arguments) {
  final String cidadeJson = '''
    [{
      "id": 1,
      "nome": "João Pessoa"
    }]
  ''';
  //se for um json que começa com [] vai retornar um list
  //se for um json que começa com {} vai retornar um Map<String,  dynamic>
  final cidadeMap = json.decode(cidadeJson);

  print(cidadeMap.runtimeType);
  cidadeMap.forEach((city) => print(city['nome']));
  // print(cidadeMap);
  // print(cidadeMap['nome']);

  // final cidadeMapJason = <String, dynamic>{
  //   'id' = 123,
  //   'nome': "João pessoa",
  //   "uf": "PB"
  // };

  final telefoneJson = '''

  {
    "ddd": 83,
    "numero": "8600000000"
  }
  ''';

  final telefone = Telefone.fromJson(telefoneJson);
  print(telefone.ddd);
  print(telefone.numero);
  print(telefone.toJson());
  print(telefone.toMap());
}

import 'dart:convert';

class Telefone {
  int ddd;
  String numero;

  Telefone({
    required this.ddd,
    required this.numero,
  });

  //método que pega o objeto(Telefone) e transforma em um Map<String, dynamic>
  Map<String, dynamic> toMap() {
    return {
      'ddd': ddd,
      'numero': numero,
    };
  }

  //o fromMap é um CONSTRUTOR, ele vai pegar um MAP e trasnformar em um objeto telefone
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      numero: map['numero'] ?? '',
    );
  }

  //é um metodo que retorna uma string json do meu objeto
  String toJson() => jsonEncode(toMap());

  //metodo baseado em uma string json retorna um objeto telefone
  factory Telefone.fromJson(String json) {
    Map<String, dynamic> jsonMap = jsonDecode(json);
    final telefone = Telefone.fromMap(jsonMap);
    return telefone;
  }

  // factory Telefone.fromJson(Map<String, dynamic> json) => Telefone(
  //       ddd: json['ddd'],
  //       numero: json['numero'],
  //     );
}

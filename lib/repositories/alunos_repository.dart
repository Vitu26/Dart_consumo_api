import 'dart:convert';

import 'package:dart_api/models/aluno.dart';
import 'package:http/http.dart' as http;

class AlunosRepository {
  Future<List<Aluno>> findAll() async {
    final alunosResponse =
        await http.get(Uri.parse('http://localhost:3031/alunos'));

    final alunosList = jsonDecode(alunosResponse.body);

    return alunosList.map<Aluno>((alunoMap) {
      return Aluno.fromMap(alunoMap);
    }).toList();
  }

  Future<Aluno> findById(String id) async {
    final alunosResponse =
        await http.get(Uri.parse('http://localhost:3031/alunos/$id'));
    final alunoMap = jsonDecode(alunosResponse.body);
    return Aluno.fromMap(alunoMap);

    //só consigo fazer assim ser for um objeto
    //return Aluno.fromJson(alunoResponse.body);
  }

  Future<void> update(Aluno aluno) async {
    await http.put(
        Uri.parse('http://localhost:3031/alunos/${aluno.id}'),
        body: aluno.toJson(),
        headers: {
          'content-type': 'application/json',
        });
  }
}

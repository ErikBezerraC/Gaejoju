import 'package:sqflite/sqflite.dart';
import 'package:projetogaejoju/db/db_helper.dart';
import 'package:projetogaejoju/domain/aulas.dart';
import 'dart:convert';

class AulaDao {
  Future<List<Aula>> listarAulas() async {
    Database db = await DBHelper().initDB();
    var result = await db.rawQuery('SELECT * FROM AULAS ORDER BY id;');
    List<Aula> aulas = [];
    for (var map in result) {
      aulas.add(Aula.fromJson(map));
    }
    return aulas;
  }

  Future<Aula?> buscarAulaPorId(int id) async {
    Database db = await DBHelper().initDB();
    var result = await db.rawQuery('SELECT * FROM AULAS WHERE id = ?;', [id]);
    if (result.isNotEmpty) {
      return Aula.fromJson(result.first);
    }
    return null;
  }

  Future<int> inserirAula(Aula aula) async {
    Database db = await DBHelper().initDB();
    return await db.insert('AULAS', aula.toJson());
  }

  Future<int> atualizarAula(Aula aula) async {
    Database db = await DBHelper().initDB();
    return await db.update(
      'AULAS',
      aula.toJson(),
      where: 'id = ?',
      whereArgs: [aula.id],
    );
  }

  Future<int> atualizarProgresso(int id, List<bool> fasesConcluidas) async {
    Database db = await DBHelper().initDB();
    String jsonFases = jsonEncode(fasesConcluidas);
    return await db.rawUpdate(
      'UPDATE AULAS SET fasesConcluidas = ? WHERE id = ?;',
      [jsonFases, id],
    );
  }
}

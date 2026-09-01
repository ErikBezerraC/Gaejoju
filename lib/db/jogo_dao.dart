import 'package:projetogaejoju/db/db_helper.dart';
import 'package:projetogaejoju/domain/jogo.dart';
import 'package:sqflite/sqflite.dart';

class JogoDao {
  Future<List<Jogo>> listarJogos() async {
    // Acessando o Banco de Dados
    Database db = await DBHelper().initDB();

    // Executando uma Consulta SQL
    var listaResult = await db.rawQuery('SELECT * FROM JOGO;');

    // Percorrer a lista de elementos
    List<Jogo> listaJogos = [];
    for (var json in listaResult) {
      // Criar o Jogo usando NamedConstructor
      Jogo jogo = Jogo.fromJson(json);

      // Add Jogo na Lista
      listaJogos.add(jogo);
    }
    await Future.delayed(Duration(seconds: 5));
    return listaJogos;
  }
}
import 'package:projetogaejoju/domain/revisao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projetogaejoju/db/db_helper.dart';

class RevisaoDao {
  Future<List<Revisao>> listarrevisao() async {
    // Acessando o Banco de Dados
    Database db = await DBHelper().initDB();

    // Executando uma Consulta SQL
    var listaResult = await db.rawQuery('SELECT * FROM REVISAO;');

    List<Revisao> listarrevisao = [];
    for (var json in listaResult) {
      // Criar a Conversas usando NamedConstructor
      Revisao revisao = Revisao.fromJson(json);

      // Add Propriedade na Lista
      listarrevisao.add(revisao);
    }

    return listarrevisao;
  }
}

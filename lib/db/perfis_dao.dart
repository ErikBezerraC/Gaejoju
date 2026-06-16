import 'package:projetogaejoju/db/db_helper.dart';
import 'package:projetogaejoju/domain/perfis.dart';
import 'package:sqflite/sqflite.dart';

class PerfisDao {
  Future<List<Perfis>> listarPerfis() async {
    // Acessando o Banco de Dados
    Database db = await DBHelper().initDB();

    // Executando uma Consulta SQL
    var listaResult = await db.rawQuery('SELECT * FROM PERFIS;');

    // Percorrer a lista de elementos
    List<Perfis> listarPerfis = [];
    for (var json in listaResult) {
      // Criar a Conversas usando NamedConstructor
      Perfis perfis = Perfis.fromJson(json);

      // Add Propriedade na Lista
      listarPerfis.add(perfis);
    }

    return listarPerfis;
  }
}
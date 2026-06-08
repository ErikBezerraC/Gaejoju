import 'package:projetogaejoju/db/db_helper.dart';
import 'package:projetogaejoju/domain/conversas.dart';
import 'package:sqflite/sqflite.dart';

class ConversasDao {
  Future<List<Conversas>> listarConversas() async {
    // Acessando o Banco de Dados
    Database db = await DBHelper().initDB();

    // Executando uma Consulta SQL
    var listaResult = await db.rawQuery('SELECT * FROM CONVERSAS;');

    // Percorrer a lista de elementos
    List<Conversas> listarConversas = [];
    for (var json in listaResult) {
      // Criar a Conversas usando NamedConstructor
      Conversas conversas = Conversas.fromJson(json);

      // Add Propriedade na Lista
      listarConversas.add(conversas);
    }

    return listarConversas;
  }
}
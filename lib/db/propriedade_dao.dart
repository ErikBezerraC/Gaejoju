import 'package:projetogaejoju/db/db_helper.dart';
import 'package:projetogaejoju/domain/propriedades.dart';
import 'package:sqflite/sqflite.dart';

class PropriedadeDao {
  Future<List<Propriedade>> listarPropriedades() async {
    // Acessando o Banco de Dados
    Database db = await DBHelper().initDB();

    // Executando uma Consulta SQL
    var listaResult = await db.rawQuery('SELECT * FROM PROPRIEDADE;');

    // Percorrer a lista de elementos
    List<Propriedade> listaPropriedades = [];
    for (var json in listaResult) {
      // Criar a Propriedade usando NamedConstructor
      Propriedade propriedade = Propriedade.fromJson(json);

      // Add Propriedade na Lista
      listaPropriedades.add(propriedade);

      // Criar a Propriedade Manualmente
      // Propriedade(
      //   urlImage: json['urlImagem'],
      //   local: json['local'],
      //   dates: json['dates'],
      //   host: json['host'],
      //   total: '\$${json['total']} total',
      // )
    }

    await Future.delayed(Duration(seconds: 5));
    return listaPropriedades;
  }
}
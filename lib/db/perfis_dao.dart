import 'package:projetogaejoju/db/db_helper.dart';
import 'package:projetogaejoju/domain/perfis.dart';
import 'package:sqflite/sqflite.dart';

class PerfisDao {
    Future<bool> login(String email, String password) async {
      Database db = await DBHelper().initDB();
      String sql = '''
        SELECT *
        FROM USER
        WHERE username = ? AND password = ?;
    ''';

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
      var result = await db.rawQuery(sql, [email, password]);
      return result.isNotEmpty;
    }

    save(Perfis perfil) async {
      Database db = await DBHelper().initDB();
      db.insert('PERFIL', perfil.toJson());
    }
  }


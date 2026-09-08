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

    var result = await db.rawQuery(sql, [email, password]);
    return result.isNotEmpty;
  }

  save(Perfis perfil) async {
    Database db = await DBHelper().initDB();
    db.insert('PERFIL', perfil.toJson());
  }
}
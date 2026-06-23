import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  // await -> async e Future<TipoDeRetorno>
  Future<Database> initDB() async {
    // Onde salvar o Banco de Dados
    // C:/database/name
    String path = await getDatabasesPath();
    // Nome do banco
    String dbName = 'duocodeeee.db';

    // Path do Banco de Dados + Nome do Banco
    String dbPath = join(path, dbName);

    // Criar e/ou Abrir o Banco de Dados
    Database db = await openDatabase(dbPath, version: 1, onCreate: onCreateDB);

    return db;
  }

  FutureOr<void> onCreateDB(Database db, int version) async {
    String sql = ''' CREATE TABLE CONVERSAS (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            img TEXT,
            nome TEXT,
            msg TEXT,
            hora TEXT
        );''';

    await db.execute(sql);

    sql = "INSERT INTO Conversas (img,nome,msg,hora) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe0fRq-Y13eilOU5TRxLv0PXf2xT-kiUT__w&s', 'Taylor Swift', 'Hi, Im Taylor', '13:13');";
    await db.execute(sql);

    sql = "INSERT INTO Conversas (img,nome,msg,hora) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoag78eTwZLaauW9vUlROdFkj82lKetZzMXA&s', 'Lady Gaga', 'Dont call me gaga', '9:11');";
    await db.execute(sql);

    sql = "INSERT INTO Conversas (img,nome,msg,hora) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaFFy4koCXHyanRg5eSX3JPMFvME0Wwaa-vQ&s', 'Juliano Floss', 'Já papou coxinha fofa?', '3:33');";
    await db.execute(sql);

    sql = "INSERT INTO Conversas (img,nome,msg,hora) VALUES ('https://s2-g1.glbimg.com/EaTgMzR1sJ8Bhl3kqCc4iJ5d-LQ=/0x0:5708x3805/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2026/D/t/AZTnixSEK7XCSBH3KnAg/ap26033005917016.jpg', 'Chappell Roan', 'Você tem filho não, né?', '5:17');";
    await db.execute(sql);

    sql = "INSERT INTO Conversas (img,nome,msg,hora) VALUES ('https://jogada10.com.br/wp-content/uploads/2024/05/GNPJ86UXcAAyvGb_Easy-Resize.com_.jpg', 'Pablo Vitar', 'Seu amor me pegou', '18:54');";
    await db.execute(sql);

    sql = "INSERT INTO Conversas (img,nome,msg,hora) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuWpLICQ-_kxetYWl1hyL8zsAHnX2yjSt3tg&s', 'Walker Scobell', 'Onde tá a Leah?', '01:43');";
    await db.execute(sql);

    sql = "INSERT INTO Conversas (img,nome,msg,hora) VALUES ('https://pbs.twimg.com/media/El7bWkMXgAE-lwV.jpg', 'Perseu Jackson', 'Eu não sou loiro burro', '14:51');";
    await db.execute(sql);

    await db.execute('''
    CREATE TABLE AULAS (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT NOT NULL,
    imagem TEXT NOT NULL,
    totalFases INTEGER DEFAULT 5,
    fasesConcluidas TEXT DEFAULT '[false, false, false, false, false]'
  )
''');

    sql = "INSERT INTO aulas (titulo,imagem) VALUES ('Variaveis', 'assets/aulas/backgroundVariaveis.png');";
    await db.execute(sql);
    sql = "INSERT INTO aulas (titulo,imagem) VALUES ('Operacoes', 'assets/aulas/backgroundVariaveisContinuando.png');";
    await db.execute(sql);
    sql = "INSERT INTO aulas (titulo,imagem) VALUES ('Condicoes', 'assets/aulas/backgroundVariaveisContinuando.png');";
    await db.execute(sql);

  }
}
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
    String dbName = 'duocode.db';

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

    sql = ''' CREATE TABLE PERFIS (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            url TEXT,
            nome TEXT
            
        );''';
    await db.execute(sql);

    sql = "INSERT INTO Perfis (url,nome) VALUES ('https://i.pinimg.com/736x/8c/b4/59/8cb459dcd8218ceb289b7b1de6d04c45.jpg', 'Daenerys Targaryen');";
    await db.execute(sql);

    sql = "INSERT INTO Perfis (url,nome) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA2hajpX0G9SkqLHY0mrgJqEq0vSGJg6_d7w&s', 'Jon Snow');";
    await db.execute(sql);

    sql = "INSERT INTO Perfis (url,nome) VALUES ('https://static.wikia.nocookie.net/gameofthrones/images/6/63/QueenSansa.PNG/revision/latest/thumbnail/width/360/height/450?cb=20210215100224', 'Sansa Stark');";
    await db.execute(sql);

    sql = "INSERT INTO Perfis (url,nome) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0Wps67IeTq9oEjF8B0mEFMlXn2vWOZiep8g&s', 'Tyrion Lennister');";
    await db.execute(sql);

    sql = ''' CREATE TABLE REVISAO (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            url TEXT,
            assunto TEXT,
            botaoCaminho TEXT
            
        );''';
    await db.execute(sql);

    sql = "INSERT INTO REVISAO (url,assunto) VALUES ('assets/revisao/revisaoVariaveis.jpg', 'VARIÁVEIS');";
    await db.execute(sql);

    sql = "INSERT INTO REVISAO (url,assunto) VALUES ('assets/revisao/revisaoVariaveis.jpg', 'OPERAÇÕES');";
    await db.execute(sql);

    sql = "INSERT INTO REVISAO (url,assunto) VALUES ('assets/revisao/revisaoVariaveis.jpg', 'CONDIÇÃO');";
    await db.execute(sql);

    sql = "INSERT INTO REVISAO (url,assunto) VALUES ('assets/revisao/revisaoVariaveis.jpg', 'REPETIÇÃO');";
    await db.execute(sql);

    sql = "INSERT INTO REVISAO (url,assunto) VALUES ('assets/revisao/revisaoVariaveis.jpg', 'FUNÇÃO');";
    await db.execute(sql);

    sql = "INSERT INTO REVISAO (url,assunto) VALUES ('assets/revisao/revisaoVariaveis.jpg', 'BIBLIOTECAS');";
    await db.execute(sql);

  }
}
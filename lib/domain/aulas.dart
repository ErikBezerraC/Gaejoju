import 'dart:convert';
import 'package:flutter/material.dart';

class Aula {
  late int? id;
  late String titulo;
  late String imagem;
  late int totalFases;
  late String fasesConcluidas;

  Aula({
    this.id,
    required this.titulo,
    required this.imagem,
    required this.totalFases,
    required this.fasesConcluidas,
  });

  Aula.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    imagem = json['imagem'];
    totalFases = json['totalFases'];
    fasesConcluidas = json['fasesConcluidas'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'imagem': imagem,
      'totalFases': totalFases,
      'fasesConcluidas': fasesConcluidas,
    };
  }

  List<bool> get listaFasesConcluidas {
    try {
      final list = jsonDecode(fasesConcluidas) as List;
      return list.map((e) => e as bool).toList();
    } catch (e) {
      return List.filled(totalFases, false);
    }
  }

  void setFasesConcluidas(List<bool> novasFases) {
    fasesConcluidas = jsonEncode(novasFases);
  }
}

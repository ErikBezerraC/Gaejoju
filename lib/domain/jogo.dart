class Jogo {
  int? id;
  String nome;
  String urlImg;

  Jogo({this.id, required this.nome, required this.urlImg});

  Jogo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        urlImg = json['urlImg'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'urlImg': urlImg,
    };
  }
}
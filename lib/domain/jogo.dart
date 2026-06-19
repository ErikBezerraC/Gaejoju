class Jogo {
  int? id;
  String nome;
  String urlImg;

  Jogo({this.id, required this.nome, required this.urlImg});

  // Construtor nomeado
  Jogo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        urlImg = json['urlImg'];

  // Método auxiliar caso precise salvar dados no futuro
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'urlImg': urlImg,
    };
  }
}
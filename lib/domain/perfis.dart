class Perfis {

  late String url;
  late String nome;

  Perfis({required this.url, required this.nome});

  Perfis.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // avaliacao = json['avaliacao'];
    url = json['url'];
    nome = json['nome'];
  }
}
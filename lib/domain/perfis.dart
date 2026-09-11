class Perfis {

  late String url;
  late String nome;
  late String password;
  late String email;

  Perfis({required this.url, required this.nome, required this.password, required this.email});

  Perfis.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // avaliacao = json['avaliacao'];
    url = json['url'];
    nome = json['nome'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["email"] = email;
    json["password"] = password;

    return json;
  }
}
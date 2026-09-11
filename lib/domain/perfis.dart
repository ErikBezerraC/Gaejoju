class Perfis {
  late String url;
  late String nome;
  late String password;
  late String email;
  String? uf; // <-- novo: estado escolhido pelo usuário

  Perfis({
    required this.url,
    required this.nome,
    required this.password,
    required this.email,
    this.uf,
  });

  Perfis.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    nome = json['nome'];
    email = json['email'];
    password = json['password'];
    uf = json['uf'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["url"] = url;
    json["nome"] = nome;
    json["email"] = email;
    json["password"] = password;
    json["uf"] = uf;
    return json;
  }
}
class Perfis {

  late String url;
  late String nome;
  late String password;
  late String email;
  late String location;
  //late Location locationNew;
  // late Lo

  Perfis({required this.url, required this.nome, required this.password, required this.email});
  Perfis.fromLocation({required this.url, required this.nome, required this.password, required this.email, required this.location});

  Perfis.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // avaliacao = json['avaliacao'];
    url = json['url'];
    nome = json['nome'];
    password = json['password'];
    email = json['email'];


  }

  Perfis.fromJsonLocation(Map<String, dynamic> json) {
    // id = json['id'];
    // avaliacao = json['avaliacao'];
    nome = json['nome'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["email"] = email;
    json["password"] = password;

    return json;
  }
}

// class Location{
//   late String lat;
//   late String long;
//   late String name;
//
//   Location.fromJson(Map<String, dynamic> json) {
//     // id = json['id'];
//     // avaliacao = json['avaliacao'];
//     lat = json['lat'];
//     long = json['long'];
//     name = json['locationName'];
//
//   }
//}
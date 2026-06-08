class Conversas {

  late String img;
  late String nome;
  late String msg;
  late String hora;

  Conversas({required this.img, required this.nome, required this.msg, required this.hora});

  Conversas.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // avaliacao = json['avaliacao'];
    img = json['img'];
    nome = json['nome'];
    msg = json['msg'];
    hora = json['hora'];
  }
}
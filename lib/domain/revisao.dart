class Revisao
{
  late String url;
  late String assunto;

  Revisao({required this.url, required this.assunto});

  Revisao.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // avaliacao = json['avaliacao'];
    url = json['url'];
    assunto = json['assunto'];

  }
}
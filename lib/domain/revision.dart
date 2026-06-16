class Revision
{
  late String url;
  late String assunto;

  Revision({required this.url, required this.assunto});

  Revision.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    // avaliacao = json['avaliacao'];
    url = json['url'];
    assunto = json['assunto'];

  }
}
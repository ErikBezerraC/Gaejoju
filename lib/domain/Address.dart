class Cat {
  late String id;
  late String url;

  Cat({
    required this.id,
    required this.url,
  });

// Construtor nomeado
  Cat.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        url = json['url'];
}
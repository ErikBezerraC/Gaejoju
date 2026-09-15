class Videos {
  final int id;
  final String titulo;
  final String youtubeUrl;

  Videos({
    required this.id,
    required this.titulo,
    required this.youtubeUrl,
  });

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      id: json['id'],
      titulo: json['titulo'],
      youtubeUrl: json['youtubeUrl'],
    );
  }
}

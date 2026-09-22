class Perfil {
  final String nome;
  final String curso;
  final String cidade;

  Perfil({
    required this.nome,
    required this.curso,
    required this.cidade,
  });
}

class FakeApi {
  final List<Perfil> _perfisFalsos = [
    Perfil(nome: 'Ana Souza', curso: 'Análise e Desenvolvimento de Sistemas', cidade: 'Arapiraca'),
    Perfil(nome: 'Bruno Lima', curso: 'Engenharia de Software', cidade: 'Maceió'),
    Perfil(nome: 'Carla Melo', curso: 'Sistemas de Informação', cidade: 'Palmeira dos Índios'),
  ];

  Future<List<Perfil>> buscarPerfis() async {
    await Future.delayed(const Duration(seconds: 2));
    return _perfisFalsos;
  }
}
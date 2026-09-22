import 'package:projetogaejoju/db/propriedade_dao.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:projetogaejoju/domain/propriedades.dart';
import 'package:projetogaejoju/widget/container_propriedade.dart';
import 'package:flutter/material.dart';
import 'package:projetogaejoju/db/shared_prefs.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  SharedPrefs prefs = SharedPrefs();
  // List<Propriedade> listaPropriedades = [];
  late Future<List<Propriedade>> futureLista;

  @override
  void initState() {
    super.initState();
    futureLista = PropriedadeDao().listarPropriedades();
    // futureLista = PropriedadesApi().listarPropriedades();
  }

  // loadData() async {
  //
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: FutureBuilder(
        future: futureLista,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Propriedade> listaPropriedades = snapshot.requireData;
            return buildListView(listaPropriedades);
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      actions: buildActions(),
      title: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.menu),
          hintText: 'Pesquisar',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
        ),
      ),
    );
  }

  buildListView(List<Propriedade> listaPropriedades) {
    return ListView.builder(
      // Tamanho da lista - Numero de repeticoes
      itemCount: listaPropriedades.length,
      // Repetir
      itemBuilder: (context, i) {
        // Chamando o novo Widget
        return ContainerPropriedade(propriedade: listaPropriedades[i]);
      },
    );
  }

  buildActions() {
    return [
      IconButton(
        onPressed: () {
          prefs.setUserStatus(false);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return LoginPage();
              },
            ),
          );
        },
        icon: Icon(Icons.logout),
      ),
    ];
  }
}
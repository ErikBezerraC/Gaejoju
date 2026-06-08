import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/db/conversas_dao.dart';
import 'package:projetogaejoju/db/fake_database.dart';
import 'package:projetogaejoju/domain/conversas.dart';
import 'package:projetogaejoju/widget/container_conversas.dart';

class Amigos extends StatefulWidget {
  const Amigos({super.key});

  @override
  State<Amigos> createState() => _AmigosState();
}

class _AmigosState extends State<Amigos> {
  List<Conversas> listaConversas = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaConversas = await ConversasDao().listarConversas();
    setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        toolbarHeight: 90, //aumenta o tamanho da app bar
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //para ir do começo do column
          children: [
            Row(
              children: [
                Text(
                  'AMIGOS', //nome lá em cima
                  style: GoogleFonts.comicNeue(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(width: 181,),
                Icon(Icons.sports_esports_outlined, color: Colors.white, size:30),

                SizedBox(width: 25,),
                Icon(Icons.person_add, color: Colors.white,size: 30),
              ],
            ),

            SizedBox(height: 5), //espaçamento da pesquisa

            SizedBox( //usei sizedbox para conseguir manipular o tamanho
              height: 40, //altura
              child: TextField( //campo de pesquisa em si
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration( //lê oq o usuario digita
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  hintText: 'Pesquisar contatos', //esse texto fica sumidinho e quando escreve desaparece
                  hintStyle: TextStyle(color: Colors.white70),

                  contentPadding: EdgeInsets.symmetric(vertical: 5),

                  enabledBorder: OutlineInputBorder( //aparência padrão da borda quando inativa
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),

                  focusedBorder: OutlineInputBorder( //aparência da borda quando está escrevendo
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      backgroundColor: Color(0xFF4F2B82),
      
      body: ListView.builder(
        itemCount: FakeDatabase.listaConvervas.length,

        itemBuilder: (context,i){
          return ContainerConversas(conversas: FakeDatabase.listaConvervas[i],);
        },
      ),
    );
  }
}
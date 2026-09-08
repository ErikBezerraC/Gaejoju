import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/db/perfis_dao.dart';
import 'package:projetogaejoju/domain/perfis.dart';
import 'package:projetogaejoju/widget/amigos_add.dart';

class AdicionarAmigo extends StatefulWidget {
  const AdicionarAmigo({super.key});

  @override
  State<AdicionarAmigo> createState() => _AdicionarAmigoState();
}

class _AdicionarAmigoState extends State<AdicionarAmigo> {

  List<Perfis> listaPerfis = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    listaPerfis = await PerfisDao().listarPerfis();
    setState(() {});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF4F2B82),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Column(
          children: [

            Text(
              'ADICIONAR AMIGOS', //nome lá em cima
              style: GoogleFonts.comicNeue(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
        backgroundColor: Color(0xFF4F2B82),
      body: Align(
            alignment: Alignment.topCenter,
            child: Container(

              height: 800,
              width: 360,

              decoration: BoxDecoration(
                  color: Color(0xFFA770F4),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: 20,),

                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: SizedBox( //usei sizedbox para conseguir manipular o tamanho
                      height: 40,
                      width: 345,//altura
                      child: TextField( //campo de pesquisa em si
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration( //lê oq o usuario digita
                          prefixIcon: Icon(Icons.search, color: Colors.white),
                          hintText: 'Pesquisar perfis', //esse texto fica sumidinho e quando escreve desaparece
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
                  ),

                  Padding(
                    padding: EdgeInsets.only(left:13, top: 15),

                    child:Text(
                      'USUÁRIOS',
                      style: GoogleFonts.comicNeue(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ),

                  Expanded(
                      child: ListView.builder(
                          itemCount: listaPerfis.length,

                          itemBuilder: (context,i){

                            return AmigosAdd(perfis: listaPerfis[i]);

                          }
                      ),
                    ),

                ],
              ),
            ),
          ),
    );
  }
}

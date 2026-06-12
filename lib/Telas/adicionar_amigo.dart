import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdicionarAmigo extends StatefulWidget {
  const AdicionarAmigo({super.key});

  @override
  State<AdicionarAmigo> createState() => _AdicionarAmigoState();
}

class _AdicionarAmigoState extends State<AdicionarAmigo> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF4F2B82),
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
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: buildContainer(),
          ),
        ],
      )
    );
  }
}

buildContainer(){
  return Container(

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

        Padding(
          padding: EdgeInsets.only(left:8, top: 7),
          
          child: Column(
            children: [
              perfis(url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCwe8VApEVx2DXkcIEBUgkLY7L3XxUWOWZWQ&s', nome: 'Daenerys Targaryen'),

              SizedBox(height: 20,),

              perfis(url: 'https://rollingstone.com.br/wp-content/uploads/jon_snow2.jpg', nome: 'Jon Snow'),

              SizedBox(height: 20,),

              perfis(url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgLcMUkPoODoGxmiSzTcIdZjiux8m-h68btA&s', nome: 'Sansa Stark'),

              SizedBox(height: 20,),

              perfis(url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXWbT9pmE7Udo9jmHYSnW5r_RACTTqZF8TSg&s', nome: 'Tyrion Lannister'),
            ],
          ),

        )

      ],
    ),
  );
}

perfis({required String url,required String nome}){
  return Container(
    height: 130,
    width: 345,

    decoration: BoxDecoration(
      color: Color(0xFF4F2B82),
      borderRadius: BorderRadius.circular(15),

    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(

            padding: EdgeInsets.only(left:15),

          child: Text(
            nome,
            style: GoogleFonts.comicNeue(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),


        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(url),
              ),

            ),
            Padding(
              padding: EdgeInsets.only(left: 80),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  minimumSize: Size(150,40),
                  side: BorderSide(
                    color: Color(0xFF8D55DE),
                    width: 4,
                  )
                ),
                onPressed: (){
                  print('Pedido enviado');
                },
                child: Text('Adicionar',style: GoogleFonts.comicNeue(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
              )

            ),

          ],
        ),
      ],
    )
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        title: Row(
          children: [

            Text('Perfil',style:GoogleFonts.comicNeue(
              color:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              )
            ),
            SizedBox(
                width:275
            ),
            Icon(Icons.settings,
              color: Colors.white,
              size: 25,
            )
          ],
        ),
      ),
      backgroundColor: Color(0xFF4F2B82),
      body: ListView(
        children:[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, //jogando o widget pra cima

              children: [
                buildContainer(url:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVJdld9FG1S3HXfELeAofZ3MWauAcBxBtwWQ&s',nome:'Marina Sena',gmail:'marinasena@gmail.com'),
                SizedBox(height: 20,),
                containerDias(),
                SizedBox(height: 15,),
                containerConquistas(),
                SizedBox(height: 15,),
                containerPorcent(),
                //quantidade de strikes, conquistas,
              ],
            ),
          ),
        ]


      ),
    );
  }
}
//esse container foi usado para colocar as informações do usuário como variáveis
buildContainer({required String url, required String nome, required String gmail }){
  return Container(
    width: 350,
    height: 270, //tamanho do container
    decoration: BoxDecoration(
      color: Color(0xFFA770F4), //adicionando cor de fundo
      borderRadius: BorderRadius.circular(8), //arredondando as bordas
    ),

    child: Center(
      child: Column(
        children:[
          SizedBox(height: 35),
          //o container foi usado para adicionar borda
          Container(
            padding: EdgeInsets.all(5), // espessura da borda
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.deepPurple, // cor da borda
            ),
            child: CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(
                url,
              ),
            ),
          ),

        //informações do usuário
          SizedBox(height: 10),
        Text(
          nome,
          style: GoogleFonts.comicNeue(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
          SizedBox(height: 5),
        Text(
          gmail,
          style:  GoogleFonts.comicNeue(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        ]
    ),
  )
  );

}

containerDias(){
  return Container(
    width: 350,
    height: 105,//tamanho do container
    alignment: Alignment.topLeft,//colocar o texto o canto superior esquerdo
    decoration: BoxDecoration(
      color: Color(0xFFA770F4), //adicionando cor de fundo
      borderRadius: BorderRadius.circular(8), //arredondando as bordas
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding: EdgeInsets.only(top: 10, left: 15),
          child: Text(
            'Dias Consecutivos',
            style: GoogleFonts.comicNeue(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only( left: 12),
              child: Stack(
                children: [
                  Icon(Icons.whatshot_outlined, color: Colors.red, size: 50),
                  Icon(Icons.whatshot, color: Colors.deepOrangeAccent, size: 48),
                  Icon(Icons.whatshot_outlined, color: Colors.amber, size: 47), //besteiragem pra fazer ficar bonitinho
                ],
              ),

            ),

            Padding(
              padding: EdgeInsets.only( left: 5),
                child: Text(
                'Selo de',
                style: GoogleFonts.comicNeue(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.only( left: 5),
                child: Text(
                  '30!',
                  style: GoogleFonts.comicNeue(
                    fontSize: 25,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
          ],
        ),
      ],
    ),

  );
}
containerConquistas(){
  return Container(
    width: 350,
    height: 105,//tamanho do container
    alignment: Alignment.topLeft,//colocar o texto o canto superior esquerdo
    decoration: BoxDecoration(
      color: Color(0xFFA770F4), //adicionando cor de fundo
      borderRadius: BorderRadius.circular(8), //arredondando as bordas
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 15),
          child: Text(
            'Suas Conquistas ',
            style: GoogleFonts.comicNeue(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only( left: 12),
                child: Icon(Icons.emoji_events, color: Colors.amber, size: 47,)

            ),

            Padding(
                padding: EdgeInsets.only( left: 5),
                child: Text(
                  'Você Tem',
                  style: GoogleFonts.comicNeue(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
            Padding(
                padding: EdgeInsets.only( left: 5),
                child: Text(
                  '55!',
                  style: GoogleFonts.comicNeue(
                    fontSize: 25,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
          ],
        ),
      ],
    ),

  );
}
containerPorcent(){
  return Container(
    width: 350,
    height: 105,//tamanho do container
    alignment: Alignment.topLeft,//colocar o texto o canto superior esquerdo
    decoration: BoxDecoration(
      color: Color(0xFFA770F4), //adicionando cor de fundo
      borderRadius: BorderRadius.circular(8), //arredondando as bordas
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10, left: 15),
          child: Text(
            'Porcentagem do Curso',
            style: GoogleFonts.comicNeue(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),

        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.transparent, //adicionando cor de fundo
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.black54, // cor da borda
                        width: 6,
                      ),
                    ) ,
                  ),
                  Container(),
                  Padding(
                    padding: EdgeInsets.only(left: 5,top: 5),
                    child: Stack(
                      children: [
                        Container(
                          height: 41,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.yellow, //adicionando cor de fundo
                            borderRadius: BorderRadius.circular(12),
                          ) ,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10,),
            Text('80%',style: GoogleFonts.comicNeue(
              fontSize: 25,
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
      ],
    ),

  );
}



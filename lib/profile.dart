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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start, //jogando o widget pra cima

             children: [
               buildContainer(url:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVJdld9FG1S3HXfELeAofZ3MWauAcBxBtwWQ&s',nome:'Marina Sena',gmail:'marinasena@gmail.com'),
               //quantidade de strikes, conquistas,
            ],
        ),
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
          )
        ),
        SizedBox(
          height:20,
        ),
        Container(
          width: 350,
          height: 270, //tamanho do container
          decoration: BoxDecoration(
            color: Color(0xFFA770F4), //adicionando cor de fundo
            borderRadius: BorderRadius.circular(8), //arredondando as bordas
          )
        ),
          SizedBox(
            height:20,
          ),
        ]
    ),
  )
  );

}

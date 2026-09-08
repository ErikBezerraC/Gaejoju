import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        title: Row(
          children: [

            Text('Configurações',style:GoogleFonts.comicNeue(
              color:Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            )
            ),
            SizedBox(
                width:180
            ),
            Icon(Icons.arrow_back,
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
              child:
                  Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      buildContainer()
                    ],

                  )

            ),
          ]


      ),
    );
  }
}

buildContainer(){
  return Container(
    height: 300,
    width: 350,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15) ,
        color: Color(0xFFA770F4)
    ),
    child:Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Vizualizar dados do perfil',style: GoogleFonts.comicNeue(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold,
              ),),

              SizedBox(
                width: 46,
              ),

              Icon(Icons.remove_red_eye_outlined,color: Colors.white, size: 23,),
            ],
          ),

          linhas(),
          Row(
            children: [
              Text('Tempo de aprendizado',style: GoogleFonts.comicNeue(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold,
              ),),

              SizedBox(
                width: 75,
              ),

              Icon(Icons.access_time,color: Colors.white, size: 23,),
            ],
          ),

          linhas(),
          Row(
            children: [
              Text('Notificações',style: GoogleFonts.comicNeue(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold,
              ),),

              SizedBox(
                width: 178,
              ),

              Icon(Icons.notifications_active,color: Colors.white, size: 23,),
            ],
          ),

          linhas(),
          Row(
            children: [
              Text('Perfis bloqueados',style: GoogleFonts.comicNeue(
                color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold,
              ),),

              SizedBox(
                width: 120,
              ),

              Icon(Icons.block,color: Colors.white, size: 23,),
            ],
          ),

          linhas(),
        ],
      ),
    ),
  );
}

linhas(){
  return Text('_______________________________________________',style: TextStyle(
    color: Colors.deepPurple, fontSize: 15,

  ),);
}
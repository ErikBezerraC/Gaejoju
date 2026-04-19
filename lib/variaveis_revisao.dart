import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VariaveisRevisao extends StatefulWidget {
  const VariaveisRevisao({super.key});

  @override
  State<VariaveisRevisao> createState() => _VariaveisRevisaoState();
}

class _VariaveisRevisaoState extends State<VariaveisRevisao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF4F2B82),

        title: Container(
          height: 45,
          width: 400,
          decoration: BoxDecoration(
            color: Color(0xFFA770F4),
              borderRadius: BorderRadius.circular(15),
          ),


          child: Row(
            children: [
              SizedBox(height: 5, width: 8,),
              Text(
                'VARIÁVEIS', style: GoogleFonts.comicNeue(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              ),

              SizedBox(width: 187,),
              Icon(Icons.arrow_back, color: Colors.white, size: 28)
            ],
          )

        ),
      ),

      backgroundColor: Color(0xFF4F2B82),
      body: ListView(
        children: [
          SizedBox(height: 17,),
          Center(
            child: Container(
              height: 1400,
              width: 365,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Color(0xFFA770F4),
                  width: 5
                )
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Text('Variáveis na linguagem C são espaços na memória usados para armazenar dados que podem ser modificados durante a execução do programa.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.comicNeue(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Container(

                    ), //adicionar a tirinha aqui
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Text('Antes de utilizá-las, é necessário declará-las informando o tipo, como int, float, char ou double. Elas podem ser inicializadas já na declaração, por exemplo: int idade = 20;. Os nomes das variáveis devem seguir regras, como não começar com números nem usar palavras reservadas. Além disso, podem ter escopo local (dentro de funções) ou global (fora delas). O uso correto de variáveis ajuda na organização e no bom funcionamento do programa.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.comicNeue(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),//adicionar a tirinha aqui
                  ),

                  SizedBox(height: 5,),

                  divisao(),

                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFA770F4),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Center(
                      child: Text('VÍDEO AULAS',style:GoogleFonts.comicNeue(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                    ),

                  ),
                  
                  Image.network('https://i.ytimg.com/vi/IY1RepWRiS0/maxresdefault.jpg')

                ],
              ),
            ),
          )
        ],
      )

    );
  }
}

divisao(){
  return Text('--------------------------------------------------------------------------------------',style:
  TextStyle(
    color: Color(0xFFA770F4),
  )
  );
}

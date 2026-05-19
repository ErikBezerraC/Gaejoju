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
              SizedBox(width: 8,),
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
              height: 1910,
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

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Image.asset('assets/revisao/revisaoVariaveis/tirinha.jpg',
                        height: 210,
                        width: 460,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Text('Antes de utilizá-las, é necessário declará-las informando o tipo, como int, float, char ou double. Elas podem ser inicializadas já na declaração, por exemplo: int idade = 20;. Os nomes das variáveis devem seguir regras, como não começar com números nem usar palavras reservadas. Além disso, podem ter escopo local (dentro de funções) ou global (fora delas). O uso correto de variáveis ajuda na organização e no bom funcionamento do programa.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.comicNeue(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                  ),

                  SizedBox(height: 5,),

                  divisao(),

                  //bloco de video

                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFA770F4),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Center(
                      child: Text('VÍDEO AULA',style:GoogleFonts.comicNeue(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                    ),

                  ),
                  SizedBox(height: 10,),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network('https://i.ytimg.com/vi/IY1RepWRiS0/maxresdefault.jpg',
                      width: 320,
                      height: 175,
                      fit: BoxFit.cover,

                    ),
                  ),
                  SizedBox(height: 5,),

                  divisao(),

                  //bloco da questão

                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xFFA770F4),
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Center(
                      child: Text('QUESTÕES',style:GoogleFonts.comicNeue(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                    ),

                  ),
                  SizedBox(height: 10,),

                  Container(
                    width: 330,
                    height: 780,
                    decoration: BoxDecoration(
                      color: Color(0xFF4F2B82),
                      borderRadius: BorderRadius.circular(15)
                    ),

                    child: Column(
                      children: [
                        Column( //apenas para coloar no canto com o crossAxis
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(width: 450,height: 10,),
                            Text(
                              '1/10  ',
                              style: GoogleFonts.comicNeue(
                                color: Colors.amber,
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Text('Em um programa de uma empresa se tem as variáveis nomeFuncionario, salarioFuncionario e idadeFuncionario. Monte o código de acordo com os tipos das variáveis:',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.comicNeue(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                        ),

                        SizedBox(height: 10,),

                        Container( //esse container é para as partes do codigo pronto
                          width: double.infinity, //ocupa todo espaco possivel
                          padding: EdgeInsets.all(10), //da um espaço nas laterais
                          child: Text(
                            '#include <stdio.h>',
                            style: GoogleFonts.comicNeue(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left, //começa na esqueda
                          ),
                        ),

                        SizedBox(height: 5,),

                        Container( //esse container é para as partes do codigo pronto
                          width: double.infinity, //ocupa todo espaco possivel
                          padding: EdgeInsets.all(10), //da um espaço nas laterais
                          child: Text(
                            'int main() {',
                            style: GoogleFonts.comicNeue(
                              color: Colors.cyanAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left, //começa na esqueda
                          ),
                        ),

                        SizedBox(height: 3,),
                        variavies(variavel: 'nomeFuncionario'),

                        SizedBox(height: 3,),
                        variavies(variavel: 'salarioFuncionario'),

                        SizedBox(height: 3,),
                        variavies(variavel: 'idadeFuncionario'),

                        Container( //esse container é para as partes do codigo pronto
                          width: double.infinity, //ocupa todo espaco possivel
                          padding: EdgeInsets.all(10), //da um espaço nas laterais
                          child: Text(
                            ' return 0;',
                            style: GoogleFonts.comicNeue(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left, //começa na esqueda
                          ),
                        ),

                        Container( //esse container é para as partes do codigo pronto
                          width: double.infinity, //ocupa todo espaco possivel
                          padding: EdgeInsets.all(10), //da um espaço nas laterais
                          child: Text(
                            '}',
                            style: GoogleFonts.comicNeue(
                              color: Colors.cyanAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left, //começa na esqueda
                          ),
                        ),

                        SizedBox(height: 10,),

                        Text('--------------------------------------------------------------------------------',style:
                        TextStyle(
                          color: Color(0xFFA770F4),
                        )
                        ),

                        SizedBox(height: 10,),

                        Row(
                          children: [
                            SizedBox(width: 10,),
                            adicionarVariaveis(tipo: 'String'),
                            SizedBox(width: 40,),
                            adicionarVariaveis(tipo: 'int'),
                          ],
                        ),
                        SizedBox(height: 8,),

                        Row(
                          children: [
                            SizedBox(width: 10,),
                            adicionarVariaveis(tipo: 'float'),
                            SizedBox(width: 40,),
                            adicionarVariaveis(tipo: 'boolean'),
                          ],
                        ),

                        SizedBox(height: 8,),

                        Container(
                          height: 38,
                          width:120,

                          decoration: BoxDecoration(
                            color:  Colors.amber,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.yellow,
                              width: 3
                            )
                          ),

                          child: Center(
                            child: Text('Enviar',style: GoogleFonts.comicNeue(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

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

variavelVazia(){
  return Container(
    width: 70,
    height: 30,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      border: Border.all(
        color: Colors.white70,
        width: 2
      )
    ),
  );
}

variavies({required String variavel}){
  return Row(
    children: [
      Container( //esse container é para as partes do codigo pronto
        alignment: Alignment.centerLeft,//ocupa todo espaco possivel
        padding: EdgeInsets.all(15), //da um espaço nas laterais
        child: variavelVazia(),
      ),
      SizedBox(width: 7,),
      Text(
        variavel,
        style: GoogleFonts.comicNeue(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),),

    ],
  );
}

adicionarVariaveis({required String tipo}) {
  return Padding(
    padding: EdgeInsets.only(left: 10), // espaço da borda
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start, //para começar no lado esquerdo
      children: [
        Container(
          height: 38,
          width:120,
          decoration: BoxDecoration(
            color: Color(0xFFA770F4),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Row(
            children: [
              SizedBox(width: 8,),
              Text(tipo, style: GoogleFonts.comicNeue(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
              Icon(Icons.add, color: Colors.amber,size: 20)
            ],
          ),
        ),
      ],
    ),
  );
}



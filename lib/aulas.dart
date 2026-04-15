import 'package:flutter/material.dart';

class Aulas extends StatefulWidget {
  const Aulas({super.key});

  @override
  State<Aulas> createState() => _AulasState();
}

class _AulasState extends State<Aulas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      //prefixIcon: Icon(Icons.whatshot),
      //prefixIcon: Icon(Icons.monetization_on),
      //suffixIcon: Icon(Icons.wallet_giftcard_sharp),     ),
      backgroundColor: Color(0xFF4F2B82),
      elevation: 0,
      flexibleSpace: Container( //flexiblespace é basicamente o conteúdo que sera colcoado na appbar(tipo child). O primeiro contrainer vai conter a cor secundária
          child: Align( //O Align é um widget usado pra posicionar um filho dentro de outro espaço. É tipo usar o stack para conseguir colocar duas informações no mesmo espaço
          alignment: Alignment.bottomCenter, //posiciona no centro na horizontal
          child: Container(//vamos colocar as informações da appbar aqui
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 13), //adiconando margens
            decoration: BoxDecoration(
                color: Color(0xFFA770F4),
                borderRadius: BorderRadius.circular(15) //box decoration pra deixar circular
            ),

              child: Center(
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Icon(Icons.whatshot_outlined, color: Colors.red, size: 37),
                        Icon(Icons.whatshot, color: Colors.deepOrangeAccent, size: 35),
                        Icon(Icons.whatshot_outlined, color: Colors.amber, size: 34), //besteiragem pra fazer ficar bonitinho
                        Positioned(//para dar espaço do icone
                            child: Text('------------------------------------------------------------------------------')
                        ),

                      ],
                    ),


                  ],
                )
            ),

          )
        )

      ),


      ),
    );
  }
}

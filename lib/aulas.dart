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
                          ],
                        ),
                        Text('-------', style: TextStyle(color: Colors.amber)),
                        Icon(Icons.monetization_on, color: Colors.amber),
                        Text('-------', style: TextStyle(color: Colors.amber)),
                        Icon(Icons.card_giftcard, color: Colors.deepPurple),
                        Text('-------', style: TextStyle(color: Colors.amber)),
                        Icon(Icons.card_giftcard, color: Colors.deepPurple),
                        Text('-------', style: TextStyle(color: Colors.amber)),
                        Icon(Icons.card_giftcard, color: Colors.deepPurple),
                        Text('-------', style: TextStyle(color: Colors.amber)),
                        Icon(Icons.card_giftcard, color: Colors.deepPurple),
                        Text('-------', style: TextStyle(color: Colors.amber)),
                        Icon(Icons.card_giftcard, color: Colors.deepPurple)
                      ],
                    )
                ),
              )
          )
      ),
    ),
      backgroundColor: Color(0xFF4F2B82),
      body:  ListView(
        children: [
          Column(
            children: [
              containerAula(url:'assets/aulas/backgroundVariaveis.png'),
              containerAula(url: 'assets/aulas/backgroundVariaveisContinuando.png'),
              containerAula(url: 'assets/aulas/backgroundVariaveisContinuando.png'),
            ],
          ),
        ],
      ),
    );
  }
}
containerBotaofase(){
  return Container(
    width: 70,
    height: 70,
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      shape: BoxShape.circle,
    ),

    child: Center(
      child: Icon(Icons.star_border_outlined, size: 30,color: Colors.white,),
    ),

  );
}
containerBotao(){
  return Container(
    width: 100,
    height: 100,
    decoration: BoxDecoration(
      color: Color(0xFF8D55DD),
      shape: BoxShape.circle,
    ),

    child: Center(
      child: Icon(Icons.star_border_outlined, size: 45,color: Colors.white,),
    ),
  );
}
containerTraco(){
  return Container(
      child: Column(
          children: [
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
            Text('|', style: TextStyle(color: Colors.white, fontSize: 2)),
          ]
      )
  );
}
containerAula({required String url}){
  return Container(
    width: 380,
    height: 830,

    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(url), fit: BoxFit.cover),
    ),

    child: Column(children: [
              SizedBox(
                height: 40,
              ),
              containerBotao(),
              containerTraco(),
              containerBotaofase(),
              containerTraco(),
              containerBotaofase(),
              containerTraco(),
              containerBotaofase(),
              containerTraco(),
              containerBotao()

            ],
            ),
  );
}
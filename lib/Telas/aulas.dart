import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projetogaejoju/widget/arvorebotao_aula.dart';
import 'package:projetogaejoju/widget/ofensiva.dart';
import 'package:projetogaejoju/domain/aulas.dart';
import 'package:projetogaejoju/db/aulas_dao.dart';


class Aulas extends StatefulWidget {
  const Aulas({super.key});

  @override
  State<Aulas> createState() => _AulasState();
}

class _AulasState extends State<Aulas> {
  List <Aula> listaAulas = [];
  @override
  void initState(){
    super.initState();
    loadData();
  }

  loadData() async{
    listaAulas = await AulaDao().listarAulas();
    print('Quantidade de aulas: ${listaAulas.length}');
    setState(() {});
  }

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
                        Ofensiva(tamanho1: 37, tamanho2: 35, tamanho3: 34,),
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
      body:  ListView.builder(
        itemCount: listaAulas.length,
        itemBuilder: (context,i){
          return ArvoreAula(aula: listaAulas[i],);
        }
        ),
    );
  }
}

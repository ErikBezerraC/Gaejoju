import 'package:flutter/material.dart';

class Revisao extends StatefulWidget {
  const Revisao({super.key});

  @override
  State<Revisao> createState() => _RevisaoState();
}

class _RevisaoState extends State<Revisao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF4F2B82),
        body: Padding(padding:
        EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
          bottom: 0, //alterando as bordas
        ),
          child: SingleChildScrollView(
            child:Column(
            children: [ //adiciona um espaço entre os containers
              buildContainer(assunto: 'VARIÁVEIS'),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'OPERAÇÕES '),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'CONDIÇÃO'),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'REPETIÇÃO'),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'FUNÇÃO'),
              SizedBox(height: 20), //adiciona um espaço entre os containers
              buildContainer(assunto: 'BIBLIOTECAS')
            ],
            )
          ),
        ),
    );
  }
}

buildContainer({required String assunto}){
  return Container(
    width: 350,
    height: 100, //tamanho do container
    decoration: BoxDecoration(
      color: Color(0xFFA770F4), //adicionando cor de fundo
      borderRadius: BorderRadius.circular(8), //arredondando as bordas
    ),
    
    child: Center(
        child: Text(assunto,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold))),
  );
}

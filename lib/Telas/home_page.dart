import 'package:flutter/material.dart';
import 'package:projetogaejoju/Telas/amigos.dart';
import 'package:projetogaejoju/Telas/aulas.dart';
import 'package:projetogaejoju/Telas/mascote.dart';
import 'package:projetogaejoju/Telas/profile.dart';
import 'package:projetogaejoju/Telas/revisao.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List pages = [
    Aulas(),
    Revisar(),
    Amigos(),
    Mascote(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF8D5CD1),
          currentIndex: selectedIndex, //o index da barra (cada posição do item) fica correspondente a variavel que declaramos
          showSelectedLabels: true, //coloca o nome dos itens nao selecionados
          unselectedItemColor: Colors.grey, //coloca cor nos itens que nao tiverem selecionados
          selectedItemColor: Colors.white, //colcoa uam cor especifica para o item selecionado
          type: BottomNavigationBarType.fixed, //tira o movimento na hora de apertar em uma item
          onTap: (index){ //a troca do item fica por toque
            setState(() {
              selectedIndex = index; //atualiza a pagina e troca a tela
            });
          },

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.desktop_windows), label: 'Aulas'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Revisao'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Amigos'),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.firefoxBrowser), label: 'Mascote'), //trocar no futuro por que é a mão
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'Profile')
          ]),

    );
  }
}
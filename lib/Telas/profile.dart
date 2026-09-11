import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/ofensiva.dart';
import '../domain/estado.dart';
import '../api/estado_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<List<Estado>> _futureEstados;
  Estado? _estadoSelecionado;

  @override
  void initState() {
    super.initState();
    _futureEstados = EstadoService().buscarEstados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4F2B82),
        title: Row(
          children: [
            Text('Perfil',
                style: GoogleFonts.comicNeue(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
            SizedBox(width: 275),
            Icon(Icons.settings, color: Colors.white, size: 25),
          ],
        ),
      ),
      backgroundColor: Color(0xFF4F2B82),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildContainer(
                  url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVJdld9FG1S3HXfELeAofZ3MWauAcBxBtwWQ&s',
                  nome: 'Marina Sena',
                  gmail: 'marinasena@gmail.com',
                ),
                SizedBox(height: 20),
                containerEstado(),
                SizedBox(height: 15),
                containerDias(),
                SizedBox(height: 15),
                containerConquistas(),
                SizedBox(height: 15),
                containerPorcent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget containerEstado() {
    return Container(
      width: 350,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFFA770F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Seu Estado',
            style: GoogleFonts.comicNeue(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          FutureBuilder<List<Estado>>(
            future: _futureEstados,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text(
                  'Erro ao carregar estados',
                  style: GoogleFonts.comicNeue(color: Colors.white),
                );
              }

              final estados = snapshot.data ?? [];

              return DropdownButton<Estado>(
                dropdownColor: Color(0xFF4F2B82),
                isExpanded: true,
                value: _estadoSelecionado,
                hint: Text('Selecione seu estado',
                    style: GoogleFonts.comicNeue(color: Colors.white70)),
                items: estados.map((estado) {
                  return DropdownMenuItem<Estado>(
                    value: estado,
                    child: Text(
                      '${estado.nome} (${estado.sigla})',
                      style: GoogleFonts.comicNeue(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (Estado? novoEstado) {
                  setState(() {
                    _estadoSelecionado = novoEstado;
                  });
                },
              );
            },
          ),
          if (_estadoSelecionado != null) ...[
            SizedBox(height: 8),
            Text(
              'Estado selecionado: ${_estadoSelecionado!.nome}',
              style: GoogleFonts.comicNeue(
                fontSize: 16,
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

//esse container foi usado para colocar as informações do usuário como variáveis
buildContainer({required String url, required String nome, required String gmail}) {
  return Container(
      width: 350,
      height: 270,
      decoration: BoxDecoration(
        color: Color(0xFFA770F4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
            children: [
              SizedBox(height: 35),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple,
                ),
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(url),
                ),
              ),
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
                style: GoogleFonts.comicNeue(
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

containerDias() {
  return Container(
    width: 350,
    height: 105,
    alignment: Alignment.topLeft,
    decoration: BoxDecoration(
      color: Color(0xFFA770F4),
      borderRadius: BorderRadius.circular(8),
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
              padding: EdgeInsets.only(left: 12),
              child: Ofensiva(tamanho1: 50, tamanho2: 48, tamanho3: 47),
            ),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Selo de',
                  style: GoogleFonts.comicNeue(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  '30!',
                  style: GoogleFonts.comicNeue(
                    fontSize: 25,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ],
    ),
  );
}

containerConquistas() {
  return Container(
    width: 350,
    height: 105,
    alignment: Alignment.topLeft,
    decoration: BoxDecoration(
      color: Color(0xFFA770F4),
      borderRadius: BorderRadius.circular(8),
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
                padding: EdgeInsets.only(left: 12),
                child: Icon(Icons.emoji_events, color: Colors.amber, size: 47)),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  'Você Tem',
                  style: GoogleFonts.comicNeue(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  '55!',
                  style: GoogleFonts.comicNeue(
                    fontSize: 25,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ],
    ),
  );
}

containerPorcent() {
  return Container(
    width: 350,
    height: 105,
    alignment: Alignment.topLeft,
    decoration: BoxDecoration(
      color: Color(0xFFA770F4),
      borderRadius: BorderRadius.circular(8),
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
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.black54,
                        width: 6,
                      ),
                    ),
                  ),
                  Container(),
                  Padding(
                    padding: EdgeInsets.only(left: 5, top: 5),
                    child: Stack(
                      children: [
                        Container(
                          height: 41,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Text(
              '80%',
              style: GoogleFonts.comicNeue(
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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projetogaejoju/domain/perfis.dart';

class AmigosAdd extends StatefulWidget {
  Perfis perfis;

  AmigosAdd({super.key, required this.perfis});

  @override
  State<AmigosAdd> createState() => _AmigosAddState();
}

class _AmigosAddState extends State<AmigosAdd> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        width: 345,

        decoration: BoxDecoration(
          color: Color(0xFF4F2B82),
          borderRadius: BorderRadius.circular(15),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(

              padding: EdgeInsets.only(left:15),

              child: Text(
                widget.perfis.nome,
                style: GoogleFonts.comicNeue(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),


            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(widget.perfis.url),
                  ),

                ),
                Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          minimumSize: Size(150,40),
                          side: BorderSide(
                            color: Color(0xFF8D55DE),
                            width: 4,
                          )
                      ),
                      onPressed: (){
                        print('Pedido enviado');
                      },
                      child: Text('Adicionar',style: GoogleFonts.comicNeue(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),),
                    )

                ),

              ],
            ),
          ],
        )
    );;
  }
}

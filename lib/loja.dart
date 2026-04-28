import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loja extends StatefulWidget {
  const Loja({super.key});

  @override
  State<Loja> createState() => _LojaState();
}

class _LojaState extends State<Loja> {
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
                  borderRadius: BorderRadius.circular(15)
              ),
              child:
              Row(
                children: [
                  SizedBox(height: 5, width: 8,),
                  Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  SizedBox(width: 120,),
                  Text('LOJA', style: GoogleFonts.comicNeue(color: Colors.white, fontSize: 28, fontWeight:  FontWeight.bold,),
                  ),
                  SizedBox(width: 60,),
                  Container(
                      height: 35,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Color(0xFF4F2B82),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child:
                      Row(
                        children: [
                          SizedBox(width: 10,),
                          Icon(Icons.monetization_on, color: Colors.amber, size: 20,),
                          Text(' 400', style: TextStyle(color: Colors.amber, fontSize: 20)
                          ),
                        ],
                      )
                  )
                ],
              )
          ),
        ),
        backgroundColor: Color(0xFF4F2B82),
        body:Row(
          children: [


            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: 150,),

                Image.asset('assets/mascoteLoja/mascoteQifrey.png',
                  height: 302,
                  width: 242,
                ),

                SizedBox(height: 170,),

                Container(
                  height: 45,
                  width: 155,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.yellow, width: 4),
                  ),
                  child: Center(
                    child: Text(
                      'COMPRAR',
                      style: GoogleFonts.comicNeue(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),


            Align(alignment: Alignment.centerRight,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  width: 150,
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        color: Color(0xFF8D55DE),

                        child: Center(
                          child: Text('ROUPA',style: GoogleFonts.comicNeue(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Color(0xFFA770F4),
                          child: ListView(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/QifreyIcon.png', url2:'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                  SizedBox(height: 10,),
                                  containerRow(url1:'assets/mascoteLoja/default.png',url2: 'assets/mascoteLoja/default.png'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}

containerRow({required String url1, required String url2}){
  return Container(
    child: Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 7,
        ),
        containerQuadrado(url: url1),
        SizedBox(
          width: 7,
        ),
        containerQuadrado(url: url2),
      ],
    ),
  );
}

containerQuadrado({required String url}){
  return Container(
    height: 65,
    width: 65,
    decoration: BoxDecoration(
        color: Color(0xFF4F2B82),
        borderRadius: BorderRadius.circular(10)
    ),

    child: Center(
      child: Image.asset(url,height: double.infinity,width: double.infinity,),
    ),

  );
}
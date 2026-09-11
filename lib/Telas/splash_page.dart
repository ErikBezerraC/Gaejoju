
import 'package:flutter/material.dart';
import 'package:projetogaejoju/Telas/home_page.dart';
import 'package:projetogaejoju/db/perfis_dao.dart';
import 'package:projetogaejoju/db/shared_prefs.dart';
import 'package:projetogaejoju/Telas/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPrefs prefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    bool status = await prefs.getUserStatus();
    await Future.delayed(Duration(seconds: 3));

    // status == true --> true
    // status == true --> false
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Login();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      color: Colors.deepPurple,
      body: Center(
        child: Icon(Icons.fox, color: Colors.white, size: 50)
      ),
    );
  }
}
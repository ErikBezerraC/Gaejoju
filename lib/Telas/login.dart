import 'package:flutter/material.dart';
import 'package:projetogaejoju/Telas/home_page.dart';
import 'package:projetogaejoju/db/perfis_dao.dart';
import 'package:projetogaejoju/db/shared_prefs.dart';
import 'package:projetogaejoju/api/perfil_api.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SharedPrefs prefs = SharedPrefs();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Entre ou cadastre-se no Airbnb',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 24),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  focusedBorder: buildPasswordOutlineInputBorder(),
                  border: buildPasswordOutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE41D56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: onPressed,
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // <-- Radius
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Cadastrar Usuário',
                  style: TextStyle(
                    color: Color(0xFFE41D56),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  onPressed() async {
    String email = userController.text;
    String password = passwordController.text;

    bool isAuth = await PerfilApi().login(email, password);

    if (isAuth) {
      await prefs.setUserStatus(true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      print('Usuário e/ou senha incorretos');
    }
  }

  buildPasswordOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
    );
  }

  buildUserOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    );
  }
}
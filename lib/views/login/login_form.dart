import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  @override
  Widget build(BuildContext context) {

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Pseudo',
                contentPadding: const EdgeInsets.only(
                    left: 100, bottom: 20, top: 20, right: 100),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              //controller: _usernameController,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Mot de passe',
                contentPadding: const EdgeInsets.only(
                    left: 100, bottom: 20, top: 20, right: 100),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
             // controller: _passwordController,
              obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: const Color(0xFF071938))),
              onPressed: () {},
              color: const Color(0xFF071938),
              textColor: Colors.white,
              padding:
                  EdgeInsets.only(top: 20, right: 100, bottom: 20, left: 100),
              child: Text("Se connecter", style: TextStyle(fontSize: 20)),
            ),
          ),
          Container(
            child: InkWell(
              child: Text(
                "Mot de passe oublié ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFFABAFB2),
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

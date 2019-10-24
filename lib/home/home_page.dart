import 'package:flutter/material.dart';
import 'package:edelsten/common/common.dart';
import 'package:edelsten/login/login.dart';
import 'package:edelsten/stone/stone.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [const Color(0xFF021534), const Color(0xFF445269)])),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LogoWidget(),
          Container(
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: const Color(0xFF071938))),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          LoginPage.routeName,
                        );
                      },
                      color: const Color(0xFF071938),
                      textColor: Colors.white,
                      padding: EdgeInsets.only(
                          top: 20, right: 100, bottom: 20, left: 100),
                      child:
                          Text("Se connecter", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: BorderSide(color: const Color(0xFFB8C8E3))),
                      onPressed: () {},
                      color: const Color(0xFFB8C8E3),
                      textColor: Colors.white,
                      padding: EdgeInsets.only(
                          top: 20, right: 100, bottom: 20, left: 100),
                      child: Text("S'inscrire", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    child: InkWell(
                      child: Text(
                        "Continuer en tant qu'utilisateur",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFFABAFB2),
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          StoneHome.routeName,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    )));
  }
}

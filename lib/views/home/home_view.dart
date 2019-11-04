import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                  ButtonWidget(
                      color: const Color(0xFF071938),
                      text: 'Se connecter',
                      function: () {
                        Navigator.pushNamed(
                          context,
                          RoutesNames.login,
                        );
                      }),
                  ButtonWidget(
                      color: const Color(0xFFB8C8E3),
                      text: 'S\'inscrire',
                      function: () {
                        Navigator.pushNamed(
                          context,
                          RoutesNames.inComing,
                        );
                      }),
                  Container(
                    padding: EdgeInsets.only(top: 15),
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
                          RoutesNames.stones,
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

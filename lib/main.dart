import 'package:edelsten/locator.dart';
import 'package:edelsten/views/home/home.dart';
import 'package:edelsten/views/login/login.dart';
import 'package:edelsten/views/stone/stone.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          LoginPage.routeName: (context) => LoginPage(),
          StoneHome.routeName: (context) => StoneHome(),
        },
        title: 'Flutter Edelsten',
        theme: ThemeData(
          primaryColor: const Color(0xFF182132),
          accentColor: const Color(0xFFB61D4F),
        ),
        home: MyHomePage(title: 'Edelsten'));
  }
}

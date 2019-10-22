import 'package:flutter/material.dart';
import 'package:edelsten/login/login.dart';
import 'package:edelsten/stone/stone.dart';
import 'package:edelsten/home/home.dart';

void main() => runApp(MyApp());

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
      home: 
        // Center(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [
        //           const Color(0xFF021534),
        //             const Color(0xFF445269)
        //         ]
        //       ),
        //     ),
        //     child: Stack(children: [MyHomePage(title: 'Edelsten')]),
        //   )
        // ),      
        MyHomePage(title: 'Edelsten')
    );
  }
}



// Widget widgetButton(text, color) = FlatButton(
//   shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(25),
//       side: BorderSide(color: const Color(0xFF071938))),
//   onPressed: () {},
//   color: const Color(0xFF071938),
//   textColor: Colors.white,
//   // padding: EdgeInsets.only(top: 20, right: 100, bottom: 20, left: 100),
//   padding: EdgeInsets.all(20),
//   child: Text("Se connecter", style: TextStyle(fontSize: 20)),
// );




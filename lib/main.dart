import 'package:edelsten/locator.dart';
import 'package:edelsten/routes/router.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:flutter/material.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Edelsten',
      theme: ThemeData(
        primaryColor: const Color(0xFF182132),
        accentColor: const Color(0xFFB61D4F),
      ),
      initialRoute: RoutesNames.home,
      onGenerateRoute: Router.generateRoute,
    );
  }
}

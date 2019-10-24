import 'package:edelsten/core/models/model.dart';
import 'package:edelsten/core/services/authentication_service.dart';
import 'package:edelsten/locator.dart';
import 'package:edelsten/routes/router.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      initialData: User.initial(),
      builder: (context) => locator<AuthenticationService>().userController,
      child: MaterialApp(
        title: 'Flutter Edelsten',
        theme: ThemeData(
          primaryColor: const Color(0xFF182132),
          accentColor: const Color(0xFFB61D4F),
        ),
        initialRoute: RoutesNames.home,
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

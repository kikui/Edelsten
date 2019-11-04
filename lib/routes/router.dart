import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/home/home.dart';
import 'package:edelsten/views/login/login.dart';
import 'package:edelsten/views/stone/stone.dart';
import 'package:flutter/material.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutesNames.stones:
        return MaterialPageRoute(builder: (_) => StonesView());
      case RoutesNames.stone:
        var stone = settings.arguments as Stone;
        return MaterialPageRoute(builder: (_) => StoneView(stone: stone.id));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
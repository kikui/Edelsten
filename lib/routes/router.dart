import 'package:edelsten/core/models/stone.dart';
import 'package:edelsten/routes/routes_names.dart';
import 'package:edelsten/views/comment/add_comment_view.dart';
import 'package:edelsten/views/home/home.dart';
import 'package:edelsten/views/login/login.dart';
import 'package:edelsten/views/stone/stone.dart';
import 'package:edelsten/views/in_coming_view.dart';
import 'package:edelsten/views/register/register.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.inComing:
        return MaterialPageRoute(builder: (_) => InComingView());
      case RoutesNames.home:
        return MaterialPageRoute(builder: (_) => HomeView());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutesNames.register:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case RoutesNames.stones:
        return MaterialPageRoute(builder: (_) => StonesView());
      case RoutesNames.comment:
        return MaterialPageRoute(builder: (_) => AddCommentView());
      case RoutesNames.favoritesStones:
        return MaterialPageRoute(builder: (_) => StonesFavoritesView());
      case RoutesNames.stone:
        var stone = settings.arguments as Stone;
        return MaterialPageRoute(
            builder: (_) => StoneView(uuidStone: stone.id));
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

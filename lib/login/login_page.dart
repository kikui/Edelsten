import 'package:flutter/material.dart';
import 'package:edelsten/common/common.dart';
import 'package:edelsten/login/login.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [const Color(0xFF021534), const Color(0xFF445269)]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                LogoWidget(),
                Container(
                  child: IntrinsicWidth(
                    child: LoginForm(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

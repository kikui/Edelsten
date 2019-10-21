import 'package:edelsten/views/common/common.dart';
import 'package:edelsten/views/login/login.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

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

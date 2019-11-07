import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class LoginNotificationWidget extends StatelessWidget {
  const LoginNotificationWidget(
      {@required this.message,
      @required this.isSuccedLogin,
      @required this.context});

  final String message;
  final bool isSuccedLogin;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red[200];
    if (isSuccedLogin) color = Colors.green[300];

    return Flushbar(
      title: isSuccedLogin ? 'Connexion réussie' : 'Connexion échouée',
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color,
      duration: Duration(seconds: 4),
    )..show(context);
  }
}

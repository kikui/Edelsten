import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget(
      {@required this.message,
      @required this.isSucced,
      @required this.title,
      @required this.context});

  final String message;
  final bool isSucced;
  final String title;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    Color color = Colors.red[200];
    if (isSucced) 
    { 
      color = Colors.green[300];
    } 

    return Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color,
      duration: Duration(seconds: 4),
    )..show(context);
  }
}

Widget getNotificationWidget({message, isSucced, title, context}){
  Color color = Colors.red[200];
    if (isSucced) 
    { 
      color = Colors.green[300];
    } 

    return Flushbar(
      title: title,
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      backgroundColor: color,
      duration: Duration(seconds: 4),
    )..show(context);
}

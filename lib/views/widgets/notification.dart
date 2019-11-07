import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

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

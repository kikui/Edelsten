import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {@required this.text, @required this.color, @required this.function});

  final String text;
  final Color color;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: color)),
        onPressed: function,
        color: color,
        textColor: Colors.white,
        padding: EdgeInsets.only(top: 20, right: 100, bottom: 20, left: 100),
        child: Text(text, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

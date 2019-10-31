import 'package:flutter/material.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({@required this.title, @required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 15)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              content,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

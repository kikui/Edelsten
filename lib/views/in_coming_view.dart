import 'package:flutter/material.dart';

class InComingView extends StatefulWidget {
  InComingView({Key key}) : super(key: key);

  @override
  _InComingViewState createState() => _InComingViewState();
}

class _InComingViewState extends State<InComingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [const Color(0xFF021534), const Color(0xFF445269)])),
      child: Center(
        child: Text(
          'Encore un peu de patience...', 
          style: TextStyle(
            color: Colors.white,
            fontSize: 20
            ),
          ),
      ),
    )));
  }
}

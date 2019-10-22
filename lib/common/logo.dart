import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/images/logo.png'),
          Text(
            'Edelsten',
            style: TextStyle(
              color: const Color(0xFFB8C8E3),
              fontSize: 35,
            ),
          ),
        ],
      ),
    );
  }
}

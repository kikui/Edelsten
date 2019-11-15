import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({
    @required this.route, @required this.color, @required this.icon, this.argument
  });
  final String route; //RouteNames class => ex : RouteNames.comments
  final Color color;
  final IconData icon;
  final dynamic argument;

  @override
  Widget build(BuildContext context) {
    return (
      FloatingActionButton(
        child: Icon(icon),
        backgroundColor: color,
        elevation: 0,
        onPressed: () => {
          Navigator.pushNamed(
            context,
            route,
            arguments: argument
          )
        }
      )
    );
  }
}

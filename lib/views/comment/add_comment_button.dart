import 'package:edelsten/routes/routes_names.dart';
import 'package:flutter/material.dart';

class AddCommentButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (
      FloatingActionButton(
        child: Icon(Icons.chat),
        backgroundColor: Colors.grey,
        elevation: 0,
        onPressed: () => {
          Navigator.pushNamed(
            context,
            RoutesNames.comment,
          )
        }
      )
    );
  }
}

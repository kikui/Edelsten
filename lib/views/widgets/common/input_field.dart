import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget(
      {@required this.fieldText, @required this.fieldController, @required this.obscureText});

  final String fieldText;
  final TextEditingController fieldController;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: fieldText,
          contentPadding:
              const EdgeInsets.only(left: 100, bottom: 20, top: 20, right: 100),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
        ),
        controller: fieldController,
        obscureText: obscureText,
      ),
    );
  }
}

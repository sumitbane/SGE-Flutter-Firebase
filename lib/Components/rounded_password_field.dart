import 'package:flutter/material.dart';
import 'package:settle_group_expenses/Components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {

  final String hintText;
  final controller;
  final bool obscureText;
  final keyboardType;
  final maxLength;

  const RoundedPasswordField({
    Key key,
    this.controller,
    this.hintText,
    this.obscureText,
    this.keyboardType,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          counterText: '',
          hintStyle: TextStyle(
            color: Colors.black26,
            fontSize: 16.5,
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
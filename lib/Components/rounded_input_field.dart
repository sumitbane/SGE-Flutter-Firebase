import 'package:flutter/material.dart';
import 'package:settle_group_expenses/Components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {

  final String hintText;
  final controller;

  const RoundedInputField({
    Key key,
    this.controller,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
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
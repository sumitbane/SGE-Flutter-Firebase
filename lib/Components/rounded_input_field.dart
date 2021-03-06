import 'package:flutter/material.dart';
import 'package:settle_group_expenses/Components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {

  final String hintText;
  final controller;
  final keyboardType;
  final maxLength;

  const RoundedInputField({
    Key key,
    this.controller,
    this.hintText,
    this.keyboardType,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          // to hide the length in the container
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
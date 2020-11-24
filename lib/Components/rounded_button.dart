import 'package:flutter/material.dart';

class RoundedButtonContainer extends StatelessWidget {

  final String text;
  final Function onPressed;

  const RoundedButtonContainer({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.deepPurple[400],
        borderRadius: BorderRadius.circular(29),
      ),
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          )
          ),
        ),
    );
  }
}

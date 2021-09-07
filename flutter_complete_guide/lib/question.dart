import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String _questionText;

  Question(this._questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(50),
      child: Text(
        _questionText,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          fontFamily: "New Roman",
          letterSpacing: 0.5,
          wordSpacing: 2,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

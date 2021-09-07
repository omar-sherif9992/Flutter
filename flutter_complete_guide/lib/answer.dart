import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback _answerQuestion;
  final String _answerText;
  Answer(this._answerQuestion, this._answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // ignore: deprecated_member_use
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          overlayColor: MaterialStateProperty.all(Colors.green),
          shadowColor: MaterialStateProperty.all(Colors.white),
        ),
        child: Text(
          _answerText,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        onPressed: _answerQuestion,
      ),
    );
  }
}

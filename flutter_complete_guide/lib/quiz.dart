import 'package:flutter/material.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final _questions;
  final _questionIndex;
  final answerButtons;
  Quiz(this._questions, this._questionIndex, this.answerButtons);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Question(_questions[_questionIndex]['questionText'] as String),
        ...answerButtons // ... is a spread function that spreads tuples or lists
      ],
    ));
  }
}

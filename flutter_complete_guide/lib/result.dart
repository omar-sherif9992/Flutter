import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final _score;
  final VoidCallback _resetQuiz;
  Result(this._score, this._resetQuiz);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        children: [
          Text(
            "Congrats \nYour Score $_score",
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              fontFamily: "New Roman",
              letterSpacing: 0.5,
              wordSpacing: 2,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              side: MaterialStateProperty.all(BorderSide(color: Colors.white)),
            ),
            child: Text(
              "Restart Quiz",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: "New Roman",
                letterSpacing: 0.5,
                wordSpacing: 2,
              ),
            ),
            onPressed: _resetQuiz,
          )
        ],
      ),
    ));
  }
}

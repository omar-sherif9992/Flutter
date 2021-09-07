import 'package:flutter/material.dart';
import './quiz.dart';
import "./answer.dart";
import "./result.dart";

//it has inbuilt widgets
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //  implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;
  final List<Map<String, Object>> _questions = const [
    //const of values means that you cant change the value or add or delete a value from the values
    //const of values means that you cant  change the variable  assigment to another value
    {
      "questionText": "What's your fav color?",
      "answers": [
        {'text': 'Black', 'score': 1},
        {'text': 'White', 'score': 2},
        {'text': 'Yellow', 'score': 4},
        {'text': 'Red', 'score': 3}
      ],
    },
    {
      "questionText": "What's your fav animal?",
      "answers": [
        {'text': 'Tiger', 'score': 9},
        {'text': 'Lion', 'score': 10},
        {'text': 'Panther', 'score': 11},
        {'text': 'Cat', 'score': 12}
      ],
    },
    {
      "questionText": "What's your fav parent?",
      "answers": [
        {'text': 'Dad', 'score': 1},
        {'text': 'Mom', 'score': 1},
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      if (_questionIndex < _questions.length) {
        _totalScore += score;
        _questionIndex += 1;
        print("Correct answer");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var answerButtons = [];
    if (_questionIndex < _questions.length) {
      answerButtons =
          (_questions[_questionIndex]["answers"] as List<Map<String, Object>>)
              .map((answer) {
        return Answer(() => _answerQuestion(answer['score'] as int),
            answer['text'] as String);
      }).toList();
    } // map returns a tuple of the objects that it's in the list  , if you add toList() it will convert the tuple into a List
    print(answerButtons);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _questionIndex,
                answerButtons // ... is a spread function that spreads tuples or lists
                )
            : Result(_totalScore, _resetQuiz),
        backgroundColor: Colors.blueGrey[400],
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              if (_questionIndex < _questions.length) {
                print(_questions.length);

                _questionIndex++;
              }
            });
          },
          label: const Text('Skip',
              style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          tooltip: 'Skip Question',
          backgroundColor: Colors.red[900],
          icon: const Icon(Icons.skip_next),
          highlightElevation: 200,
        ),
      ),
    );
  }
}

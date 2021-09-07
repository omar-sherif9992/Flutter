import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _texts = const ["I know how to cook", "hello World", "bye world"];
  Random random = new Random();
  var _index = 0;

  void _nextText() {
    setState(() {
      _index = random.nextInt(_texts.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(" hey  dice")),
        body: Center(
          child: Column(
            children: [
              Text(_texts[_index]),
              ElevatedButton(
                onPressed: _nextText,
                child: Text("Change Text"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

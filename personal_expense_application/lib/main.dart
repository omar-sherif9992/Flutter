import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Card(
                  child: Text("Chart"),
                  elevation: 5,
                  color: Colors.purple[200],
                ),
              ),
              UserTransaction()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

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
  String titleInput;
  String amountInput;
  List<Transaction> _transactions = [
    Transaction(
      id: "1",
      title: "New Shoe",
      amount: 69.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      title: "New short",
      amount: 82.9,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Center(
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
          Card(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    autocorrect: true,
                    autofillHints: ["omar"],
                    autofocus: true,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      labelText: "Title",
                      filled: true,
                    ),
                    onChanged: (title) {
                      titleInput = title;
                    },
                  ),
                  TextField(
                    autocorrect: true,
                    autofocus: true,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      labelText: "Amount",
                      filled: true,
                    ),
                    onChanged: (amount) {
                      amountInput = amount;
                    },
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: Colors.blue[800],
                    onPressed: () {
                      print(titleInput);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: _transactions.map((transaction) {
              return Card(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green[900], width: 2),
                      ),
                      child: Text(
                        "\$" + transaction.amount.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.green[900],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          transaction.title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMd().add_jm().format(transaction.date),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                elevation: 5,
              );
            }).toList(),
          ),
        ],
      )),
    );
  }
}

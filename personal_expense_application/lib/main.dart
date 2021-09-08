import 'package:expense_application/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './widgets/chart.dart';
import './widgets/transaction_card.dart';
import './widgets/new_transaction.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      //You define a theme globally and can then tap into it from anywhere in your app.
      theme: ThemeData(
        primaryColor: Colors.purple[600],
        accentColor: Colors.amber[700],
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
              fontFamily: "OpenSans",
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactionList = [];

  List<Transaction> get _recentTransactionList {
    return _userTransactionList.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(
      () {
        _userTransactionList.add(newTransaction);
      },
    );
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(
            addNewTransaction: _addNewTransaction,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            tooltip: "Add Item",
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Chart(
                recentTransactions: _recentTransactionList,
              ),
            ),
            _userTransactionList.isEmpty
                ? Column(
                    children: <Widget>[
                      Text(
                        "No Transaction have been added yet !",
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 35),
                      Container(
                          height: 200,
                          child: Image.asset("assets/image/waiting.png",
                              fit: BoxFit.cover))
                    ],
                  )
                : TransactionList(_userTransactionList),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: "Add Item",
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}

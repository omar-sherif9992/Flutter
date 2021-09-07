import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'transaction_card.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactionList = [
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

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      NewTransaction(addNewTransaction: _addNewTransaction),
      TransactionList(_userTransactionList)
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactionList;
  TransactionList(this._userTransactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (ctx, index) {
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
                    "\$" + _userTransactionList[index].amount.toString(),
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
                      _userTransactionList[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd()
                          .add_jm()
                          .format(_userTransactionList[index].date),
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
        },
        itemCount: _userTransactionList.length,
      ),
    );
  }
}

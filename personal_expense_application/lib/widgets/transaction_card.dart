import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactionList;
  final Function _deleteTransaction;

  TransactionList(this._userTransactionList, this._deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  width: 70,
                  child: FittedBox(
                    child: Text(
                      "\$" +
                          _userTransactionList[index].amount.toStringAsFixed(2),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _userTransactionList[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyText1,
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
                  ),
                  MediaQuery.of(context).size.width > 360
                      // ignore: deprecated_member_use
                      ? FlatButton.icon(
                          onPressed: () => _deleteTransaction(
                              _userTransactionList[index].id),
                          icon: Icon(Icons.delete),
                          label: Text("Delete"),
                          textColor: Theme.of(context).errorColor,
                        )
                      : IconButton(
                          onPressed: () => _deleteTransaction(
                              _userTransactionList[index].id),
                          color: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          tooltip: "Delete Item",
                        )
                ],
              ),
            ],
          ),
          elevation: 5,
        );
      },
      itemCount: _userTransactionList.length,
    );
  }
}
//user Profile
/* Widget User() {
  return ListTile(
    leading: CircleAvatar(
      radius: 30,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: FittedBox(
          child: Text("Avatar"),
        ),
      ),
    ),
    title: Text("title"),
    subtitle: Text("Subtitle"),
    trailing: IconButton(
      icon: Icon(
        Icons.delete,
      ),
    ),
  ); */
//}

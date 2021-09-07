import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  NewTransaction({@required this.addNewTransaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: true,
              autofillHints: ["omar"],
              autofocus: false,
              enableSuggestions: true,
              decoration: InputDecoration(
                labelText: "Title",
                filled: true,
              ),
              controller: titleController,
            ),
            TextField(
              autocorrect: true,
              autofocus: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                labelText: "Amount",
                filled: true,
              ),
              controller: amountController,
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
                addNewTransaction(
                    titleController.text, double.parse(amountController.text));
              },
            ),
          ],
        ),
      ),
    );
  }
}

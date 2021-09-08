import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction({@required this.addNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredAmount <= 0 || enteredAmount > 9999) {
      amountController.text = " Enter between 0 and 10000 !";
      return;
    }
    if (enteredTitle.isEmpty || amountController.text.isEmpty) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount);
    Navigator.of(context).pop(); // to close an pop-of screen
    titleController.text = "";
    amountController.text = "";
  }

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
              onSubmitted: (_) => submitData(),
              enableSuggestions: true,
              decoration: InputDecoration(
                labelText: "Title",
                filled: true,
              ),
              controller: titleController,
            ),
            TextField(
              autocorrect: true,
              autofocus: false,
              enableSuggestions: true,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
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
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}

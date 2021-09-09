import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction({@required this.addNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    final enteredTitle = titleController.text;
    double enteredAmount = 0;
    try {
      enteredAmount = double.parse(amountController.text);
    } catch (Exception) {
      amountController.text = " Enter between 0 and 10000 !";
      return;
    }
    if (enteredAmount <= 0 || enteredAmount > 9999) {
      amountController.text = " Enter between 0 and 10000 !";
      return;
    }
    if (enteredTitle.isEmpty ||
        amountController.text.isEmpty ||
        _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);
    Navigator.of(context).pop(); // to close an pop-of screen
    titleController.text = "";
    amountController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          margin: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 100,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                autocorrect: true,
                autofillHints: ["Groocery"],
                autofocus: false,
                onSubmitted: (_) => _submitData(),
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
                onSubmitted: (_) => _submitData(),
                decoration: InputDecoration(
                  labelText: "Amount",
                  filled: true,
                ),
                controller: amountController,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate == null
                        ? "No Date Choosed"
                        : "Picked Date:" +
                            DateFormat.yMd().format(_selectedDate),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  Platform.isIOS
                      ? CupertinoButton(
                          child: Text(
                            "Add Transaction",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: _submitData,
                        )
                      : FlatButton(
                          textColor: Theme.of(context).primaryColor,
                          child: Text(" Choose a Date"),
                          onPressed: () => _presentDatePicker(context),
                        )
                ],
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                child: Text(
                  "Add Transaction",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

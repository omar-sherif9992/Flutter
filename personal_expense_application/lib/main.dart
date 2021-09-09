import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:expense_application/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './widgets/chart.dart';
import './widgets/transaction_card.dart';
import './widgets/new_transaction.dart';

void main() {
  //This adjust your phone orientation only to portrait mode
  // import 'package:flutter/services.dart'; ==> import this library needed
  /* WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp],
  ); */
  runApp(
    MyApp(),
  );
}

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
              ),
            ),
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
  bool _showChart = false;

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

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);
    setState(
      () {
        _userTransactionList.add(newTransaction);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactionList.removeWhere((tx) {
        return tx.id == id;
      });
    });
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
    final sizeHeight = MediaQuery.of(context).size.height;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              "Personal Expenses",
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _startAddNewTransaction(context),
                  child: Icon(CupertinoIcons.add),
                )
              ],
            ))
        : AppBar(
            title: Text('Personal Expenses'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                tooltip: "Add Item",
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
          );
    final txListWidget = _userTransactionList.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                "No Transaction have been added yet !",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: (sizeHeight - appBar.preferredSize.height) * 0.03),
              Container(
                  height: isPortrait
                      ? (sizeHeight - appBar.preferredSize.height) * 0.3
                      : (sizeHeight - appBar.preferredSize.height) * 0.3,
                  child: Image.asset("assets/image/waiting.png",
                      fit: BoxFit.cover))
            ],
          )
        : Container(
            height: (sizeHeight -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.6,
            child: TransactionList(_userTransactionList, _deleteTransaction),
          );
    final pageBody = SafeArea(
      // reserves important spaces for things out of our hands
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isPortrait == false)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Show Chart",
                    style: Theme.of(context).textTheme.title,
                  ),
                  Switch.adaptive(
                    // ios look by using adaptive
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (isPortrait)
              Container(
                height: isPortrait
                    ? (sizeHeight - appBar.preferredSize.height) * 0.4
                    : (sizeHeight - appBar.preferredSize.height) * 0.7,
                width: double.infinity,
                child: Chart(
                  recentTransactions: _recentTransactionList,
                ),
              ),
            _showChart && !isPortrait
                ? Container(
                    height: isPortrait
                        ? (sizeHeight - appBar.preferredSize.height) * 0.4
                        : (sizeHeight - appBar.preferredSize.height) * 0.7,
                    width: double.infinity,
                    child: Chart(
                      recentTransactions: _recentTransactionList,
                    ),
                  )
                : txListWidget
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pageBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform
                    .isIOS // check for Platform .isLinux .isMacOS .isWindows
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    tooltip: "Add Item",
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}

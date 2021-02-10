import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses_fcg/new_transaction.dart';
import 'modal/transaction.dart';
import 'transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // String titleInput;
  // String amountInput;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions = [
    Transaction(id: '1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    Transaction(id: '1', title: 'Weekly Groceries', amount: 66.99, date: DateTime.now()),
  ];

  void _addNewTransaction(String title, double txAmount) {
    final newTx = Transaction(
      title: title,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
           onTap: () {},
           child: NewTransaction(_addNewTransaction),
           behavior: HitTestBehavior.opaque,
          );
        },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {})
        ],
      ),
      body:
          SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue,
                    child: Text('CHART!'),
                    elevation: 5,
                  ),
                ),
                TransactionList(_userTransactions)
              ],
            ),
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_startNewTransaction(context),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import './modal/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical:10,
                      horizontal:15
                  ),
                  decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2,),),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.purple
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _userTransactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat().format(_userTransactions[index].date),
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],),
              ],
            ),
            );
          },
          itemCount: _userTransactions.length,
          ),
      );
  }
}

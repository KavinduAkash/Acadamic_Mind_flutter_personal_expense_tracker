import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {

    final enterdTitle = titleController.text;
    final enterdAmount = double.parse(amountController.text);

    if(enterdTitle.isEmpty || enterdAmount<=0) {
      return;
    }

    this.widget.addTx(
        enterdTitle,
        enterdAmount
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_)=> _submitData(),
              // onChanged: (val) {
              //  titleInput = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_)=> _submitData(),
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            FlatButton(
              onPressed: _submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}

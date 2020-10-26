import 'package:flutter/material.dart';

class NewTransactionInput extends StatelessWidget {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final Function addTransaction;

  NewTransactionInput(this.addTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
            ),
            ElevatedButton(
              onPressed: () {
                addTransaction(
                  _titleController.text,
                  double.parse(_amountController.text),
                );
              },
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}

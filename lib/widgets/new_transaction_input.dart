import 'package:flutter/material.dart';

class NewTransactionInput extends StatefulWidget {
  final Function addTransaction;

  NewTransactionInput(this.addTransaction);

  @override
  _NewTransactionInputState createState() => _NewTransactionInputState();
}

class _NewTransactionInputState extends State<NewTransactionInput> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void _submitData() {
		var enteredTitle = _titleController.text;
		var enterdAmount = double.parse(_amountController.text);

		if (enteredTitle.isEmpty || enterdAmount <= 0) {
			return;
		}

    widget.addTransaction(
      enteredTitle,
      enterdAmount,
    );

		Navigator.of(context).pop();
  }

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
              onPressed: _submitData,
              child: Text('Add Transaction'),
            )
          ],
        ),
      ),
      elevation: 5,
    );
  }
}

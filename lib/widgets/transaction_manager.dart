import 'package:flutter/material.dart';
import './new_transaction_input.dart';
import './transaction_list.dart';

import '../models/transaction.dart';

class TransactionManager extends StatefulWidget {
  @override
  _TransactionManagerState createState() => _TransactionManagerState();
}

class _TransactionManagerState extends State<TransactionManager> {
  final List<Transaction> _transactions = [
    Transaction(
        id: '1', title: 'JoJo merch', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Hentai merch', amount: 19.99, date: DateTime.now()),
  ];

  void addNewTransaction(String newTitle, double newAmount) {
    final newTx = Transaction(
      title: newTitle,
			amount: newAmount,
			id: DateTime.now().toString(),
			date: DateTime.now(),
    );

		setState(() {
		  _transactions.add(newTx);
		});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransactionInput(addNewTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}

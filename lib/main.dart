import 'package:flutter/material.dart';

import './widgets/new_transaction_input.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

import './models/constants.dart' as constants;
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: constants.primaryThemeColor,
        accentColor: constants.secondaryThemeColor,
				errorColor: constants.errorThemeColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                fontSize: 16),
						headline5: TextStyle(
								fontSize: 12,
						)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 19,
                fontWeight: FontWeight.bold,
              )),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
					foregroundColor: Colors.white,
					backgroundColor: Theme.of(context).appBarTheme.color,
				),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [];

	List<Transaction> get _getRecentTransactions {
		return _transactions.where((tx) {
			// Return list of all transactions happened in the span of this week
			// hence the .now() subtracts 7 days.
			return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
		}).toList();
	}

  void _startAddingNewTransaction(ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransactionInput(_addNewTransaction),
          // behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _addNewTransaction(String newTitle, double newAmount, DateTime newDate) {
    final newTx = Transaction(
      title: newTitle,
      amount: newAmount,
      id: DateTime.now().toString(),
      date: newDate,
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

	void _deleteTransaction(String transactionID) {
		setState(() {
		  _transactions.removeWhere((element) => element.id == transactionID);
		});
	}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_business),
            onPressed: () => _startAddingNewTransaction(context),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddingNewTransaction(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                width: double.infinity,
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: Chart(_getRecentTransactions),
                  elevation: 6,
                )),
            TransactionList(_transactions, _deleteTransaction),
          ],
        ),
      ),
    );
  }
}

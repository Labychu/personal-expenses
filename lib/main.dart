import 'package:flutter/material.dart';
import './widgets/new_transaction_input.dart';
import './widgets/transaction_list.dart';
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
        primarySwatch: Colors.indigo ,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  final List<Transaction> _transactions = [
    Transaction(
        id: '1', title: 'JoJo merch', amount: 69.99, date: DateTime.now()),
    Transaction(
        id: '2', title: 'Hentai merch', amount: 19.99, date: DateTime.now()),
  ];

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

  void _addNewTransaction(String newTitle, double newAmount) {
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
                  child: Text(
                    'Chart here!',
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.headline1.color,
                    ),
                  ),
                  elevation: 5,
                )),
            TransactionList(_transactions),
          ],
        ),
      ),
    );
  }
}

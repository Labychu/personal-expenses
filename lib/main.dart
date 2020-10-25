import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
	final List<Map<>> transactions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App title'),
      ),
      body: Column(
				mainAxisAlignment: MainAxisAlignment.spaceEvenly,
				crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
						width: double.infinity,
            child: Card(
						color: Colors.blue,
              child: Text('Chart here!'),
              elevation: 5,
            ),
          ),
          Card(
						color: Colors.deepOrange,
            child: Text('List of transactions.'),
          )
        ],
      ),
    );
  }
}

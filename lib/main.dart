import 'package:flutter/material.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Ammount'),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: transactions.map((tx) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text('\$${tx.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            )),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        )),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            DateFormat('dd/MM/yyyy').format(tx.date),
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ],
                  ),
                );
              }).toList(),
            )
          ]),
    );
  }
}

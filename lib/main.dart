import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 5000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Jacket', amount: 2000, date: DateTime.now()),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            // backgroundColor: const Color.fromARGB(255, 0, 97, 89),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.black54,
            title: const Text('Budget Tracker'),
          ),
          backgroundColor: const Color.fromARGB(255, 33, 33, 33),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: sized_box_for_whitespace
              Container(
                width: double.infinity,
                child: const Card(
                  //Card depends on size of its child.
                  //Or can be wrapped in container which can determine its size
                  //Which is not true if wrapped in coloumn as coloumn depends on size of its child
                  //In column can use cross axis alignment as stretch
                  color: Colors.teal,
                  elevation: 5,
                  child: Text('Chart'),
                ),
              ),
              Column(
                //dynamic card allocation for transactions
                //As children take only list of widgets we map tansactions list to iterable of widgets and convert to list
                children: transactions.map((tx) {
                  return Card(
                    color: const Color.fromARGB(255, 89, 89, 89),
                    shadowColor: Colors.grey,
                    child: Row(children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 121, 187, 180),
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          tx.amount.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 121, 187, 180),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(223, 255, 255, 255),
                            ),
                          ),
                          Text(
                            tx.date.toString(),
                            style: const TextStyle(
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ]),
                  );
                }).toList(),
              )
            ],
          )),
    );
  }
}

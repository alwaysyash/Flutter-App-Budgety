//This is file for list widget

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // ignore: unused_field
  final List<Transaction> transactions;

  const TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      //dynamic card allocation for transactions
      //As children take only list of widgets we map tansactions list to iterable of widgets and convert to list
      children: transactions.map((tx) {
        return Card(
          color: const Color.fromARGB(255, 80, 80, 80),
          shadowColor: Colors.grey,
          child: Row(children: [
            // ignore: avoid_unnecessary_containers
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(
                  // color: const Color.fromARGB(255, 121, 187, 180),
                  color: Colors.tealAccent,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                // tx.amount.toString(),
                // (string interpolation) after $ sign we can reference variable or property name
                //This is used to concatenate string (string interpolation)
                'Rs. ${tx.amount}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.tealAccent,
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
                  // DateFormat('dd-MM-yyyy').format(tx.date),
                  DateFormat.yMMMd().format(tx.date), //.add_jm() for time
                  style: const TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ]),
        );
      }).toList(),
    );
  }
}

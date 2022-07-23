//This is file for list widget
//ListView.builder() first used here

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
    // ignore: sized_box_for_whitespace
    return Container(
      height: 400,
      // child: SingleChildScrollView(
      //   child: Column(
      //colum size based on container
      //dynamic card allocation for transactions
      //As children take only list of widgets we map tansactions list to iterable of widgets and convert to list

      // child: ListView(//use builder for more optimisation
      //as listview is infinite having Container gives it a constraint
      //as column takes available space automatically

      // children: //cant be used with builder

      child: ListView.builder(
        //builder function will be called by flutter for every item
        itemBuilder: (context, index) {
          //index is index of item to be rendered
          return Card(
            color: const Color.fromARGB(255, 80, 80, 80),
            shadowColor: Colors.grey,
            child: Row(children: [
              // ignore: avoid_unnecessary_containers
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  'Rs. ${transactions[index].amount}', //transactions was previously tx 'Rs. ${tx.amount}'
                  //index is argument provided by flutter. Used to render the specific number of list
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
                    transactions[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(223, 255, 255, 255),
                    ),
                  ),
                  Text(
                    // DateFormat('dd-MM-yyyy').format(tx.date),
                    DateFormat.yMMMd()
                        .format(transactions[index].date), //.add_jm() for time
                    style: const TextStyle(
                      color: Colors.white60,
                    ),
                  ),
                ],
              ),
            ]),
          );
        },

        itemCount: transactions.length, //how many item to built
        // builder funciton will be builts for above number of times
        //so no need to map list of transactions to widgets
        // replace tx used previously with transactions directly
        // transactions.map((tx) {

        // }).toList(), //map list of transactions to widgets
      ),
    );
  }
}

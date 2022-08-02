//This is file for list widget
//ListView.builder() first used here

// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, duplicate_ignore

import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/rendering.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  // ignore: unused_field
  final List<Transaction> transactions;
  final Function deleteTX;
  const TransactionList(this.transactions, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return
        // child: SingleChildScrollView(
        //   child: Column(
        //colum size based on container
        //dynamic card allocation for transactions
        //As children take only list of widgets we map tansactions list to iterable of widgets and convert to list

        // child: ListView(//use builder for more optimisation
        //as listview is infinite having Container gives it a constraint
        //as column takes available space automatically

        // children: //cant be used with builder

        transactions.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.1,
                    ),
                    const Text(
                      'No Transaction yet!',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'Quicksand',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.05,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/ZZZ.png',
                        scale: 3,
                      ),
                    ),
                  ],
                );
              })
            : ListView.builder(
                //builder function will be called by flutter for every item
                itemBuilder: (context, index) {
                  //index is index of item to be rendered

//===========================================================================================================

                  return Card(
                    // ignore: prefer_const_constructors
                    elevation: 10,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    color: const Color.fromARGB(255, 80, 80, 80),
                    shadowColor: Colors.black,
                    child: Row(children: [
                      // ignore: avoid_unnecessary_containers
                      Container(
                        width: 110,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(44, 0, 0, 0),
                                spreadRadius: 2,
                                blurRadius: 6),
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            // tx.amount.toString(),
                            // (string interpolation) after $ sign we can reference variable or property name
                            //This is used to concatenate string (string interpolation)
                            'Rs. ${transactions[index].amount}', //transactions was previously tx 'Rs. ${tx.amount}'
                            //index is argument provided by flutter. Used to render the specific number of list
                            style: const TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Color.fromARGB(255, 207, 255, 244),
                              fontFamily: 'Quicksand',
                            ),
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
                              fontFamily: 'Quicksand',
                              color: Color.fromARGB(223, 255, 255, 255),
                            ),
                          ),
                          Text(
                            // DateFormat('dd-MM-yyyy').format(tx.date),
                            DateFormat.yMMMd().format(
                                transactions[index].date), //.add_jm() for time
                            style: const TextStyle(
                              color: Colors.white60,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      MediaQuery.of(context).size.width > 500
                          ? TextButton.icon(
                              onPressed: () {
                                deleteTX(transactions[index].id);
                              },
                              icon: const Icon(Icons.delete),
                              label: const Text("Delete"),
                              style: TextButton.styleFrom(primary: Colors.teal),
                            )
                          : IconButton(
                              onPressed: () {
                                deleteTX(transactions[index].id);
                              },
                              icon: const Icon(Icons.delete),
                              color: const Color.fromARGB(255, 0, 184, 166),
                              splashColor: Colors.red,
                            )
                    ]),
                  );

//===========================================================================================================
                },

                itemCount: transactions.length, //how many item to built
                // builder funciton will be builts for above number of times
                //so no need to map list of transactions to widgets
                // replace tx used previously with transactions directly
                // transactions.map((tx) {

                // }).toList(), //map list of transactions to widgets
              );
  }
}

import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // late String titleInput;
  // late String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            // backgroundColor: const Color.fromARGB(255, 0, 97, 89),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.black54,
            shadowColor: Colors.black12,
            
            title:  const Text(
              'Budget Tracker',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 33, 33, 33),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
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

              const UserTransactions(),
            ],
          )),
    );
  }
}

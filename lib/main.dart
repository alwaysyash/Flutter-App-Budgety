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

          // title: Container(
          //   padding: const EdgeInsets.all(8),
          //   child: Image.asset(
          //     'assets/appbar.png',
          //     fit: BoxFit.contain,
          //   ),
          // ),
          centerTitle: false,
          title: SizedBox(
            height: 50,
            width: 150,
            child: Image.asset(
              'assets/appbar.png',
              fit: BoxFit.fill,
            ),
          ),
          leadingWidth: 0,

          //const Text(
          //   'Budget Tracker',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          // ),

          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outline_outlined,
                size: 26,
                color: Colors.black,
              ),
            )
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        body: SingleChildScrollView(
          //for keyboard warning
          //can be only added at body level because
          //it cant determine its size directly so it takes whole body as scrollable
          child: Column(
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
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.teal,
          foregroundColor: Colors.black87,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

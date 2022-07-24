import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Quicksand',
    
      ),
      home: MyApp(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // late String titleInput;
  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: 't1',
    //   title: 'Shoes',
    //   amount: 5000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Jacket',
    //   amount: 2000,
    //   date: DateTime.now(),
    // ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      //here _userTransaction is final i.e. only address is final
      _userTransaction.add(newTx);
    });
  }

  void _startAddNew(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        ); //pass the pointer of function
      },
      backgroundColor: const Color.fromARGB(255, 80, 80, 80),
    );
  }

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
            Builder(
              builder: (context) => IconButton(
                onPressed: () => _startAddNew(context),
                icon: const Icon(
                  Icons.add_circle_outline_outlined,
                  size: 26,
                  color: Colors.black,
                ),
              ),
            ),
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

              TransactionList(_userTransaction),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () => _startAddNew(context),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.black87,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}

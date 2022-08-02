// ignore_for_file: prefer_const_constructors, unused_element, duplicate_ignore, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

// ignore: unused_import
import 'package:flutter/services.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
// ignore: unused_import
import './widgets/chart.dart';

void main() {
  //Lock Portrait

  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
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
        primaryColor: Colors.teal,
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
  // ignore: prefer_final_fields
  bool _showChart = true;
  List<Transaction> get _recentTransactionsList {
//where can be used in list to run a function on each element
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) {
        return element.id == id;
      });
    });
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
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
    final mediaQuery = MediaQuery.of(
        context); //Better performance in same build method use same mediaQuery
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final appBar = AppBar(
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
    );

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(_userTransaction, _deleteTransaction),
    );
    return MaterialApp(
      home: Scaffold(
        appBar: appBar,
        backgroundColor: Color.fromARGB(255, 40, 40, 40),
        body: SingleChildScrollView(
          //for keyboard warning
          //can be only added at body level because
          //it cant determine its size directly so it takes whole body as scrollable
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ignore: sized_box_for_whitespace
              //special use of if statements in list if true then show else mon on in list of children
              if (isLandscape)
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: const Text(
                        'Show Chart',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Switch(
                      activeColor: Colors.tealAccent,
                      value: _showChart,
                      onChanged: (val) {
                        setState(
                          () {
                            _showChart = val;
                          },
                        );
                      },
                    ),
                  ],
                ),
              if (!isLandscape)
                Container(
                  width: double.infinity,
                  child:
                      //Card depends on size of its child.
                      //Or can be wrapped in container which can determine its size
                      //Which is not true if wrapped in coloumn as coloumn depends on size of its child
                      //In column can use cross axis alignment as stretch
                      // ignore: sized_box_for_whitespace

                      Container(
                          height: (mediaQuery.size.height -
                                  appBar.preferredSize.height -
                                  mediaQuery.padding.top) *
                              0.3,
                          child: Chart(_recentTransactionsList,
                              appBar.preferredSize.height)),
                ),

              // mediaQuery.padding.top is for status bar
              //Deducting to remove general scrolling

              if (!isLandscape) txListWidget,

              if (isLandscape)
                _showChart
                    ? Container(
                        width: double.infinity,
                        child:
                            // ignore: sized_box_for_whitespace
                            Container(
                                height: (mediaQuery.size.height -
                                        appBar.preferredSize.height -
                                        mediaQuery.padding.top) *
                                    0.7,
                                child: Chart(_recentTransactionsList,
                                    appBar.preferredSize.height)),
                      )
                    : txListWidget,
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

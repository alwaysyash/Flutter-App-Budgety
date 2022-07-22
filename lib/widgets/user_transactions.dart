import 'package:flutter/material.dart';
import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key? key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  // ignore: unused_field
  final List<Transaction> _userTransaction = [
    Transaction(id: 't1', title: 'Shoes', amount: 5000, date: DateTime.now()),
    Transaction(id: 't2', title: 'Jacket', amount: 2000, date: DateTime.now()),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),//pass the pointer of function
        TransactionList(_userTransaction),
      ],
    );
  }
}

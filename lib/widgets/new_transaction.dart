//This is file for Text Inputs

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount < 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    ); //call function from, user_transactions
    Navigator.of(context).pop(); //to close sheet as soon as entry is added
  }

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 80, 80, 80),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                focusColor: Colors.teal,
                labelText: "Title ",
                labelStyle: TextStyle(
                  color: Colors.tealAccent,
                  fontFamily: 'Quicksand',
                ),
              ),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
              onSubmitted: (_) => submitData(),
              //as this is anonymous function we need to call the function only reference is not enough
              //to onSubmitted reference to anonymous function is passed
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                focusColor: Colors.teal,
                labelText: "Amount ",
                labelStyle: TextStyle(
                  color: Colors.tealAccent,
                  fontFamily: 'Quicksand',
                ),
              ),
              controller: amountController,
              onSubmitted: (_) =>
                  submitData(), //onSubmitted gives a string value. We dont use it but need to accept it '_'
              // onChanged: (val) {
              //   amountInput = val;
              // },
              keyboardType: TextInputType.number,
            ),
            TextButton(
              onPressed: submitData,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.tealAccent),
              ),
              child: const Text(
                "Add Transaction",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

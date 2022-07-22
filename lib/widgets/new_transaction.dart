//This is file for Text Inputs

import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;

  // ignore: use_key_in_widget_constructors
  NewTransaction(this.addTx);

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
                ),
              ),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                focusColor: Colors.teal,
                labelText: "Amount ",
                labelStyle: TextStyle(
                  color: Colors.tealAccent,
                ),
              ),
              controller: amountController,
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            TextButton(
              onPressed: () {
                addTx(
                    titleController.text, double.parse(amountController.text));
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.tealAccent),
              ),
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}

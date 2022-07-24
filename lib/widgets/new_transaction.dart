//This is file for Text Inputs

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime? _selectedDate;
  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount < 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    ); //call function from, user_transactions
    Navigator.of(context).pop(); //to close sheet as soon as entry is added
  }

  void _datepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.teal,
              onPrimary: Colors.black,
              surface: Colors.teal,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: const Color.fromARGB(255, 44, 44, 44),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

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
            // ignore: sized_box_for_whitespace
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No Date chosen!"
                          : "Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}",
                      style: const TextStyle(
                        color: Colors.tealAccent,
                        fontFamily: 'Quicksand',
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _datepicker,
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Colors.tealAccent),
                    ),
                    child: const Text(
                      "Choose Date",
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal),
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

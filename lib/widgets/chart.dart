// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

// ignore: unused_import
import 'dart:ffi';

import 'package:expenses/models/transaction.dart';
import 'package:expenses/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  // ignore: prefer_const_constructors_in_immutables
  Chart(this.recentTransactions);

  List<Map<String, dynamic>> get groupedTransactions {
    //dynamic instead of Object
    return List.generate(7, (index) {
      //index is last 7 days from 0(current day), 1 , 2
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      double totalSum = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year ==
                weekDay
                    .year) //check seperately as weekDay has both Date and Time
        {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      }; //DateFormat.E(weekDay) gives day of the date in one letter
    });
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, item) {
      // ignore: unnecessary_cast
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 80, 80, 80),
      shadowColor: Color.fromARGB(255, 0, 0, 0),
      elevation: 6,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          // ignore: prefer_const_literals_to_create_immutables
          children: groupedTransactions
              .map((data) //function in map runs on every bject in list
                  {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                (data['day']) as String,
                (data['amount']) as double,
                totalSpending == 0.0
                    ? 0.0
                    : ((data['amount']) as double) / totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

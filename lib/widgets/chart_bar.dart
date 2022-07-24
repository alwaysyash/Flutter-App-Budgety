// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  // ignore: prefer_const_constructors_in_immutables
  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child: Text(
          'Rs ${spendingAmount.toStringAsFixed(0)}',
          style: TextStyle(color: Colors.tealAccent),
        )),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 4,
        ),
        Container(
          height: 100,
          width: 10,
          child: Stack(
            //used to place children overlapping each other
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(50, 0, 0, 0),
                        spreadRadius: 4,
                        blurRadius: 8),
                  ],
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 0, 184, 166),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          label,
          style: TextStyle(
              color: Colors.tealAccent,
              fontFamily: 'Quicksand',
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

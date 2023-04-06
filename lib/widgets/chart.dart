import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transaction;

  const Chart(this.transaction, {super.key});

  List<Map<String, Object>> get transactionValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < transaction.length; i++) {
        if (transaction[i].date.day == weekDay.day &&
            transaction[i].date.month == weekDay.month &&
            transaction[i].date.year == weekDay.year) {
          totalSum += transaction[i].price;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'price': totalSum,
      };
    }).reversed.toList();
  }

  double get totalPrice {
    return transactionValue.fold(
        0.0, (sum, element) => sum + (element['price'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: transactionValue
              .map((e) => Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        (e['day'] as String),
                        (e['price'] as double),
                        totalPrice == 0.0
                            ? 0.0
                            : (e['price'] as double) / totalPrice),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './transaction_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTransaction;

  const TransactionList(this.transaction, this.deleteTransaction, {super.key});
  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  const Text('No Transactions added yet!'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (context, index) => TransactionItem(
                transaction: transaction[index],
                deleteTransaction: deleteTransaction),
            // Card(
            //   child: Row(children: [
            //     Container(
            //       child: Text(
            //         '\$${transaction[index].price.toStringAsFixed(2)}',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20,
            //           color: Theme.of(context).primaryColor,
            //         ),
            //       ),
            //       margin: EdgeInsets.symmetric(
            //         vertical: 10,
            //         horizontal: 15,
            //       ),
            //       padding: EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //           border: Border.all(
            //         color: Theme.of(context).primaryColor,
            //         width: 2,
            //       )),
            //     ),
            //     Column(
            //       children: [
            //         Text(
            //           transaction[index].title,
            //           style: TextStyle(
            //             fontFamily: 'OpenSans',
            //             fontWeight: FontWeight.bold,
            //             fontSize: 18,
            //           ),
            //         ),
            //         Text(
            //           DateFormat.yMMMd().format(transaction[index].date),
            //           style: TextStyle(
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ],
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //     ),
            //   ]),
            // ),
            itemCount: transaction.length,
          );
  }
}

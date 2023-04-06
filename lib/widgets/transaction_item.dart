import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text('\$${transaction.price.toStringAsFixed(2)}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStatePropertyAll(Theme.of(context).accentColor),
                ),
                onPressed: () => deleteTransaction(transaction.id),
                label: const Text(
                  'Delete',
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).accentColor,
                onPressed: () => deleteTransaction(transaction.id),
              ),
      ),
    );
  }
}

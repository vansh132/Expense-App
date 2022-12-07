// ignore_for_file: library_private_types_in_public_api,, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctz, constrains) {
            return Column(
              children: [
                Text(
                  'No Trasantion added yet',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 20),
                Container(
                  height: constrains.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        )),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          onPressed: () => deletetx(transactions[index].id),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all(
                                  Theme.of(context).errorColor)),
                          icon: Icon(Icons.delete),
                          label: Text("Delete"))
                      : IconButton(
                          onPressed: () => deletetx(transactions[index].id),
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}

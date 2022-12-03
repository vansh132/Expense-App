// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              /* onChanged: (value) {
                      titleInput = value;
                    }, */
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), // _ defines that there will be some argument that we are never going to use
              /* onChanged: (value) {
                      amountInput = value;
                    }, */
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text("No Date chosen!!"),
                  TextButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor)),
                      onPressed: null,
                      child: Text(
                        "Choose date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            ElevatedButton(
              onPressed:
                  submitData, // pass reference when there is no anonomous function
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).primaryColor)),
            )
          ],
        ),
      ),
    );
  }
}

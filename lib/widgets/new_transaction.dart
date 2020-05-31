import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final textController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              autocorrect: true,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: textController,
            ),
            TextField(
              autocorrect: true,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: (() {
                addTx(textController.text, int.parse(amountController.text));
              }),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredText = textController.text;
    final amountText = int.parse(amountController.text);

    if (enteredText.isEmpty || amountText <= 0) {
      return;
    }

    widget.addTx(
      enteredText,
      amountText,
    );

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
          children: <Widget>[
            TextField(
              autocorrect: true,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Title",
              ),
              controller: textController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              autocorrect: true,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text("Add Transaction"),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}

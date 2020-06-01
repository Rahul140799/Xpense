import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate;

  void _submitData() {

    if(_amountController.text.isEmpty) {
      return;
    }

    final enteredText = _textController.text;
    final amountText = int.parse(_amountController.text);

    if (enteredText.isEmpty || amountText <= 0 || _pickedDate == null) {
      return;
    }

    widget.addTx(
      enteredText,
      amountText,
      _pickedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((selectedDate) {
      setState(() {
        _pickedDate = selectedDate;
      });
    });
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
              controller: _textController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              autocorrect: true,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Amount",
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(_pickedDate == null
                      ? 'No Date Chosen !'
                      : 'PickedDate: ${DateFormat.yMd().format(_pickedDate)}'),
                ),
                FlatButton(
                  onPressed: _presentDatePicker,
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Choose Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            RaisedButton(
              child: Text("Add Transaction"),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleContoller = TextEditingController();

  final amountContoller = TextEditingController();

  void submitData() {
    final enteredTitle = titleContoller.text;
    final enteredAmount = double.parse(amountContoller.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleContoller,
                onSubmitted: (_) => submitData()
                // onChanged: (value) => titleInput = value,
                ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountContoller,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => amountInput = value,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Text('No Date Chosen!'),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction'),
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button!.color,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}

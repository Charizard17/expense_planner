import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleContoller = TextEditingController();
  final amountContoller = TextEditingController();

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleContoller.text;
    final enteredAmount = double.parse(amountContoller.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    addTx(
      enteredTitle,
      enteredAmount,
    );
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
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}

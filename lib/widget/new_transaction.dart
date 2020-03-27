import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  void submitData() {
    final title = titleInputController.text;
    final amount = double.parse(amountInputController.text);

    if (title.isEmpty || amount <=0) {
      return;
    }
    widget.addTx(titleInputController.text, amountInputController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleInputController,
                    onSubmitted: (_) => submitData,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountInputController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (_) => submitData,
                  ),
                  FlatButton(
                    child: Text('Add Transaction'),
                    onPressed: submitData,
                    textColor: Colors.purple,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

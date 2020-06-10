import 'dart:math';

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deletTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deletTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {

  Color _bgColor;

  @override
  void initState() {
    const avilableColors = [Colors.red , Colors.black , Colors.blue , Colors.purple];

    _bgColor = avilableColors[Random().nextInt(4)];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text(
                  '\$ ${widget.transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          DateFormat.yMMMMEEEEd().format(widget.transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 360
            ? FlatButton.icon(
                onPressed: () => widget.deletTx(widget.transaction.id),
                icon: Icon(Icons.delete),
                label: Text('Delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => widget.deletTx(widget.transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
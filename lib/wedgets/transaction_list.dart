import 'package:flutter/material.dart';
import './transaction_item.dart';
import 'package:personal_expenses_app/models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletTx;

  TransactionList(this.transactions, this.deletTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No data yet !!',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset('assets/images/img.jpg'),
                ),
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                  key: ValueKey(tx.id), //Keys must be in the root widget of the listView ,and We also used UniqueKey() but it didn't work because it generate unque key but it changed every time the build method is called
                      transaction: tx,
                      deletTx: deletTx,
                    ))
                .toList(),
          );
  }
}

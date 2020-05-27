import 'package:flutter/material.dart';
import 'package:personal_expenses_app/wedgets/user_transactions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

/*
  String titleInput;
  String amountInput;
*/
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                color: Colors.blue,
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Text(
                    'Charts ',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              UserTransactions(),
            ],
          ),
        ),
      ),
    );
  }
}

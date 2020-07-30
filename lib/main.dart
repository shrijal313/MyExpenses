import 'package:expenseTx/widgets/newTransaction.dart';
import 'package:expenseTx/widgets/transactionList.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   final List<Transaction> _userTransactions = [
    Transaction(id: '1', title: "1st", amount: 100.00, date: DateTime.now()),
    Transaction(id: '2', title: "2st", amount: 50.00, date: DateTime.now()),
    Transaction(id: '3', title: "4st", amount: 98.00, date: DateTime.now()),
  ];

  void _addNewTx(String title, double amt) {
    final newTx = Transaction(
      title: title,
      amount: amt,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }


  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){

      return GestureDetector(
        onTap: (){},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(_addNewTx)); 
    }, ) ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
        actions: [
          IconButton(onPressed: (){
            _startAddNewTransaction(context);
          },
          icon: Icon(Icons.add)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Card(
                child: Text("Chart", style: TextStyle(color: Colors.white),),
                color: Theme.of(context).primaryColor,
                elevation: 10,
                
              ),
            ),
      TransactionList(_userTransactions),
          ]),

        
      ),
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),
        onPressed: (){
                      _startAddNewTransaction(context);

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}

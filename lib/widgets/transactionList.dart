import 'package:expenseTx/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

 final List<Transaction> transactions;

 TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
     child: transactions.isEmpty? Column(children: [
       Text("No Transactions yet!!!", style: TextStyle(
         fontSize: 20,
         fontWeight: FontWeight.w600,
       ),),
       Image(
         image: AssetImage("assets/images/waiting.png",),
         fit: BoxFit.cover,
       )
     ],)
     
     : ListView.builder(
       itemCount: transactions.length,
       itemBuilder: (context, index){
return Card(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                )),
                padding: EdgeInsets.all(10),
                child: Text(
                  '\$${transactions[index] .amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactions[index].title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    DateFormat.yMMMEd().format(transactions[index].date),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
       },

    
          ),
      
    );
  }
}

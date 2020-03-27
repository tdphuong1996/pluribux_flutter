import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pluribux/model/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final week = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == week.day &&
            recentTransactions[i].date.month == week.month &&
            recentTransactions[i].date.year == week.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E(week), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[],
        ),
      ),
    );
  }
}

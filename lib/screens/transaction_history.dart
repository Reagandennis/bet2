import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatefulWidget {
  @override
  _TransactionHistoryScreenState createState() => _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  // Simulated transaction data
  List<Transaction> transactions = [
    Transaction(type: TransactionType.deposit, amount: 100, date: DateTime.now()),
    Transaction(type: TransactionType.withdrawal, amount: -50, date: DateTime.now().subtract(Duration(days: 1))),
    // ...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transaction History')),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text('${transaction.type.toString()}: ${transaction.amount}'),
            subtitle: Text('Date: ${transaction.date.toString()}'),
          );
        },
      ),
    );
  }
}

enum TransactionType {
  deposit,
  withdrawal,
  betPlacement,
  // ...
}

class Transaction {
  final TransactionType type;
  final double amount;
  final DateTime date;

  Transaction({required this.type, required this.amount, required this.date});
}

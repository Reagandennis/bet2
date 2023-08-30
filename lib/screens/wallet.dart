// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class SendMoneyScreen extends StatefulWidget {
  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  TextEditingController _amountController = TextEditingController();

  // Simulate sending money to account
  Future<void> _sendMoney() async {
    final double amount = double.tryParse(_amountController.text) ?? 0.0;

    // Implement your logic here to send money (e.g., API call)

    // Show success message or handle errors
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendMoney,
              child: Text('Send Money'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Send Money App',
    home: SendMoneyScreen(),
  ));
}

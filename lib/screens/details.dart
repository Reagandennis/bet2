import 'package:bet2/screens/home.dart';
import 'package:flutter/material.dart';

class BetDetailsScreen extends StatelessWidget {
  final Bet bet; // Assume Bet class from previous examples

  BetDetailsScreen(this.bet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bet Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bet Title: ${bet.title}'),
            Text('Odds: ${bet.odds}'),
            // Other details...
          ],
        ),
      ),
    );
  }
}

// Use MaterialPageRoute to navigate to this screen:
// Navigator.push(context, MaterialPageRoute(builder: (context) => BetDetailsScreen(selectedBet)));

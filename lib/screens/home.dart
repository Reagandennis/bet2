import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Bet {
  final String id;
  final String title;
  final double odds;

  Bet({required this.id, required this.title, required this.odds});
}

class Game {
  final String id;
  final String name;
  final List<String> highlights;

  Game({required this.id, required this.name, required this.highlights});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bet> bets = [];
  Game? currentGame;

  @override
  void initState() {
    super.initState();
    _fetchData(); // Fetch data from your API
  }

  Future<void> _fetchData() async {
    // Fetch bets and current game data from API
    final betsResponse = await http.get('YOUR_BETS_API_ENDPOINT' as Uri);
    final gameResponse = await http.get('YOUR_CURRENT_GAME_API_ENDPOINT' as Uri);

    if (betsResponse.statusCode == 200 && gameResponse.statusCode == 200) {
      final betsData = json.decode(betsResponse.body) as List;
      final gameData = json.decode(gameResponse.body);

      setState(() {
        bets = betsData.map((data) => Bet(id: data['id'], title: data['title'], odds: data['odds'])).toList();
        currentGame = Game(id: gameData['id'], name: gameData['name'], highlights: List<String>.from(gameData['highlights']));
      });
    } else {
      // Handle error cases
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Betting App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (currentGame != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Current Game:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text(currentGame!.name),
                  Text('Highlights:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Column(
                    children: currentGame!.highlights.map((highlight) => Text('- $highlight')).toList(),
                  ),
                ],
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: bets.length,
              itemBuilder: (context, index) {
                final bet = bets[index];
                return ListTile(
                  title: Text(bet.title),
                  subtitle: Text('Odds: ${bet.odds.toStringAsFixed(2)}'),
                  // Add onTap logic for bet selection
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Betting App',
    home: HomePage(),
  ));
}

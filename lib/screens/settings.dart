import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(
        child: Text('Settings Screen Content'),
      ),
    );
  }
}

// Use MaterialPageRoute to navigate to this screen:
// Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));

import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> rankingData = [
    {'username': 'Player1', 'xp': 1200},
    {'username': 'Player2', 'xp': 1100},
    {'username': 'Player3', 'xp': 1000},
  ]; // Example data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Ranking'),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.builder(
        itemCount: rankingData.length,
        itemBuilder: (context, index) {
          final player = rankingData[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Text(
                '${index + 1}',
                style: TextStyle(color: Colors.black),
              ),
            ),
            title: Text(
              player['username'],
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              '${player['xp']} XP',
              style: TextStyle(color: Colors.greenAccent),
            ),
          );
        },
      ),
    );
  }
}
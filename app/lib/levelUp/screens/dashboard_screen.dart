import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Text(
          'Welcome to LevelUp!',
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
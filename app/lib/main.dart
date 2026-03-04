import 'package:flutter/material.dart';
import 'login.dart';      // Importamos LoginScreen
import 'welcome.dart';    // Importamos WelcomeScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Comenzamos con la pantalla de login
    );
  }
}
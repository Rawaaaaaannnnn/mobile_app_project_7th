import 'package:flutter/material.dart';
import 'Home_screen.dart'; // Import the HomeScreen
import 'signin_screen.dart'; // Import SignInScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beauty Products',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: SignInScreen(), // Set the SignInScreen as the starting screen
    );
  }
}

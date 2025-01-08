import 'package:flutter/material.dart';
import 'package:plucknpay/pages/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pluck\'nPay',
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'LeagueSpartan'),
          bodyMedium: TextStyle(fontFamily: 'LeagueSpartan'),
          // Add other text styles as needed
        ),
      ),
      home: LandingScreen(),
    );
  }
}

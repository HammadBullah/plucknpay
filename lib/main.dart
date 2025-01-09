import 'package:flutter/material.dart';
import 'package:plucknpay/pages/landing.dart';
import 'package:plucknpay/pages/themedata.dart';// Import your theme data file

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pluck\'nPay',
      theme: lightTheme, // Light theme
      darkTheme: darkTheme, // Dark theme
      themeMode: ThemeMode.system, // Set theme mode
      home: LandingScreen(), // Pass toggle function
    );
  }
}

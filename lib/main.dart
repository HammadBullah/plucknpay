import 'package:flutter/material.dart';
import 'package:plucknpay/pages/landing.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlucknPay', // Example project name
      theme: ThemeData(
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      home: LandingScreen(), // Start with the sign-in page
    );
  }
}

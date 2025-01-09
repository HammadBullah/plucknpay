import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.deepOrangeAccent,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black, fontFamily: 'LeagueSpartan', fontSize: 16.0),
    bodyMedium: TextStyle(color: Colors.black, fontFamily: 'LeagueSpartan', fontSize: 14.0),
    titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  ),
  iconTheme: IconThemeData(color: Colors.black),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepOrangeAccent,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepOrangeAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, backgroundColor: Colors.deepOrangeAccent,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepOrangeAccent,
  scaffoldBackgroundColor: Colors.black87,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white, fontFamily: 'LeagueSpartan', fontSize: 16.0),
    bodyMedium: TextStyle(color: Colors.white, fontFamily: 'LeagueSpartan', fontSize: 14.0),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepOrangeAccent,
    titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(color: Colors.black87),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.deepOrangeAccent,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black87, backgroundColor: Colors.deepOrangeAccent,
    ),
  ),
);

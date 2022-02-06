import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      primaryColor: Colors.pink[400],
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          elevation: 0.0,
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.pink[400],
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.black,
          elevation: 0.0,
          textTheme: Theme.of(context).textTheme));

  static Color pinkLight = Color(0xffffdbea);
  static Color pinkDark = Color(0xff260010);
}

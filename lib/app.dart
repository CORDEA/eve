import 'package:eve/ui/base.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eve',
      theme: ThemeData(
        primaryColor: Colors.yellow[600],
        accentColor: Colors.brown[400],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Colors.brown[400],
        ),
      ),
      home: Base(),
    );
  }
}

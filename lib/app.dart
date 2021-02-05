import 'package:eve/ui/base.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eve',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Base(),
    );
  }
}

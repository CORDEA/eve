import 'package:eve/ui/home.dart';
import 'package:flutter/material.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('eve'),
      ),
      body: Home(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}

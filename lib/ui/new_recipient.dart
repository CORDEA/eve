import 'package:flutter/material.dart';

class NewRecipient extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => NewRecipient());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About the recipient')),
      body: Center(),
    );
  }
}

import 'package:eve/bloc/new_recipient_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewRecipient extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => NewRecipient());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NewRecipientBloc(),
      child: _NewRecipient(),
    );
  }
}

class _NewRecipient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About the recipient')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        children: [
          _NewRecipientTextField(label: 'Bank code'),
          const SizedBox(height: 16),
          _NewRecipientTextField(label: 'Branch code'),
          const SizedBox(height: 16),
          _NewRecipientTextField(label: 'Account number'),
          const SizedBox(height: 16),
          _NewRecipientTextField(label: 'Name'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        tooltip: 'Next',
        onPressed: () {},
      ),
    );
  }
}

class _NewRecipientTextField extends StatelessWidget {
  final String label;

  const _NewRecipientTextField({Key key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Theme.of(context).accentColor,
      ),
      child: TextField(
        cursorColor: Theme.of(context).accentColor,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}

import 'package:eve/bloc/new_recipient_bloc.dart';
import 'package:eve/models/recipient.dart';
import 'package:eve/ui/transfer.dart';
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
    var recipient = context.select<NewRecipientBloc, Recipient>(
      (value) => value.recipient,
    );
    Future.microtask(() {
      if (recipient != null) {
        Navigator.of(context).push(Transfer.route(recipient));
      }
    });
    return Scaffold(
      appBar: AppBar(title: const Text('About the recipient')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
        children: [
          _NewRecipientTextField(
            label: 'Bank code',
            onChanged: context.read<NewRecipientBloc>().onBankCodeChanged,
          ),
          const SizedBox(height: 16),
          _NewRecipientTextField(
            label: 'Branch code',
            onChanged: context.read<NewRecipientBloc>().onBranchCodeChanged,
          ),
          const SizedBox(height: 16),
          _NewRecipientTextField(
            label: 'Account number',
            onChanged: context.read<NewRecipientBloc>().onAccountNumberChanged,
          ),
          const SizedBox(height: 16),
          _NewRecipientTextField(
            label: 'Name',
            onChanged: context.read<NewRecipientBloc>().onNameChanged,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        tooltip: 'Next',
        onPressed: context.read<NewRecipientBloc>().submit,
      ),
    );
  }
}

class _NewRecipientTextField extends StatelessWidget {
  final String label;
  final ValueChanged<String> onChanged;

  _NewRecipientTextField({
    Key key,
    this.label,
    this.onChanged,
  }) : super(key: key);

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
        onChanged: onChanged,
      ),
    );
  }
}

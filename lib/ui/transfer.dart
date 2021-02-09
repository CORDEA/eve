import 'package:eve/bloc/transfer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transfer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TransferBloc(context.read()),
      child: _Transfer(),
    );
  }
}

class _Transfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TransferContent();
}

class _TransferContent extends State<_Transfer> {
  @override
  void initState() {
    super.initState();
    context.read<TransferBloc>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return _TransferSectionLabel(text: 'Starred');
          case 1:
            return _TransferSectionLabel(text: 'Past recipients');
          default:
            return Center();
        }
      },
    );
  }
}

class _TransferSectionLabel extends StatelessWidget {
  final String text;

  const _TransferSectionLabel({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        top: 16,
        right: 24,
        bottom: 16,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

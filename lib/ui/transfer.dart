import 'package:flutter/material.dart';

class Transfer extends StatelessWidget {
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

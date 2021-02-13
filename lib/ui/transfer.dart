import 'package:eve/models/recipient.dart';
import 'package:eve/ui/recipient_ext.dart';
import 'package:flutter/material.dart';

class Transfer extends StatelessWidget {
  static Route route(Recipient recipient) => MaterialPageRoute(
        builder: (_) => Transfer(
          recipient: recipient,
        ),
      );

  final Recipient recipient;

  const Transfer({Key key, @required this.recipient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transfer')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          _TransferSourceItem(),
          const SizedBox(height: 16),
          const Icon(Icons.arrow_downward),
          const SizedBox(height: 16),
          _TransferDestinationItem(recipient: recipient),
          const SizedBox(height: 44),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Theme.of(context).accentColor,
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixText: '¥',
                ),
                cursorColor: Theme.of(context).accentColor,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Pay'),
        icon: Icon(Icons.check),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _TransferSourceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 4),
            Text(
              '',
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: Theme.of(context).textTheme.subtitle1.color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TransferDestinationItem extends StatelessWidget {
  final Recipient recipient;

  const _TransferDestinationItem({
    Key key,
    @required this.recipient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recipient.name,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: 12),
            Text(
              recipient.formattedBankName,
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 4),
            Text(
              recipient.accountNumber,
              style: Theme.of(context).textTheme.caption.copyWith(
                    color: Theme.of(context).textTheme.subtitle1.color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

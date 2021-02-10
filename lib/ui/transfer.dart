import 'package:eve/bloc/transfer_bloc.dart';
import 'package:eve/ui/section_label.dart';
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
    var starredLength = context.select<TransferBloc, int>(
      (value) => value.numberOfStarredRecipients,
    );
    var pastLength = context.select<TransferBloc, int>(
      (value) => value.numberOfPastRecipients,
    );
    return ListView.builder(
      itemCount: starredLength + pastLength + 3,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _TransferSectionLabel(text: 'Starred');
        }
        if (index <= starredLength) {
          return _TransferItem(index: index - 1);
        }
        if (index == starredLength + 1) {
          return _TransferSectionLabel(text: 'Past recipients');
        }
        if (index <= starredLength + pastLength + 1) {
          return _TransferItem(index: index - 2);
        }
        return _TransferNewItem();
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
      child: SectionLabel(text: text),
    );
  }
}

class _TransferItem extends StatelessWidget {
  final int _index;

  const _TransferItem({Key key, @required int index})
      : _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Selector<TransferBloc, String>(
                selector: (_, bloc) => bloc.recipients[_index].name,
                builder: (_, text, __) => Text(
                  text,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              const SizedBox(height: 12),
              Selector<TransferBloc, String>(
                selector: (_, bloc) =>
                    bloc.recipients[_index].formattedBankName,
                builder: (_, text, __) => Text(
                  text,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              const SizedBox(height: 4),
              Selector<TransferBloc, String>(
                selector: (_, bloc) => bloc.recipients[_index].accountNumber,
                builder: (_, text, __) => Text(
                  text,
                  style: Theme.of(context).textTheme.caption.copyWith(
                        color: Theme.of(context).textTheme.subtitle1.color,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransferNewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

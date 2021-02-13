import 'package:eve/bloc/recipients_bloc.dart';
import 'package:eve/ui/new_recipient.dart';
import 'package:eve/ui/recipient_ext.dart';
import 'package:eve/ui/section_label.dart';
import 'package:eve/ui/transfer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Recipients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RecipientsBloc(context.read()),
      child: _Recipients(),
    );
  }
}

class _Recipients extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RecipientsContent();
}

class _RecipientsContent extends State<_Recipients> {
  @override
  void initState() {
    super.initState();
    context.read<RecipientsBloc>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    var starredLength = context.select<RecipientsBloc, int>(
      (value) => value.numberOfStarredRecipients,
    );
    var pastLength = context.select<RecipientsBloc, int>(
      (value) => value.numberOfPastRecipients,
    );
    return ListView.builder(
      itemCount: starredLength + pastLength + 3,
      itemBuilder: (context, index) {
        if (index == 0) {
          return _RecipientSectionLabel(text: 'Starred');
        }
        if (index <= starredLength) {
          return _RecipientItem(index: index - 1);
        }
        if (index == starredLength + 1) {
          return _RecipientSectionLabel(text: 'Past recipients');
        }
        if (index <= starredLength + pastLength + 1) {
          return _RecipientItem(index: index - 2);
        }
        return _RecipientNewItem();
      },
    );
  }
}

class _RecipientSectionLabel extends StatelessWidget {
  final String text;

  const _RecipientSectionLabel({Key key, this.text}) : super(key: key);

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

class _RecipientItem extends StatelessWidget {
  final int _index;

  const _RecipientItem({Key key, @required int index})
      : _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: InkWell(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Selector<RecipientsBloc, String>(
                  selector: (_, bloc) => bloc.recipients[_index].name,
                  builder: (_, text, __) => Text(
                    text,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(height: 12),
                Selector<RecipientsBloc, String>(
                  selector: (_, bloc) =>
                      bloc.recipients[_index].formattedBankName,
                  builder: (_, text, __) => Text(
                    text,
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                const SizedBox(height: 4),
                Selector<RecipientsBloc, String>(
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
          onTap: () {
            Navigator.of(context).push(
              Transfer.route(
                context.read<RecipientsBloc>().recipients[_index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _RecipientNewItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Icon(Icons.add),
          ),
          onTap: () {
            Navigator.of(context).push(NewRecipient.route());
          },
        ),
      ),
    );
  }
}

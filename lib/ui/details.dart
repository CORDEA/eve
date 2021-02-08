import 'package:eve/bloc/details_bloc.dart';
import 'package:eve/models/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailsBloc(context.read()),
      child: _Details(),
    );
  }
}

class _Details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailsContent();
}

class _DetailsContent extends State<_Details> {
  @override
  void initState() {
    super.initState();
    context.read<DetailsBloc>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    var length = context.select<DetailsBloc, int>(
      (value) => value.details.length,
    );
    return ListView.builder(
      itemCount: length,
      itemBuilder: (_, index) => _DetailsItem(index: index),
    );
  }
}

class _DetailsItem extends StatelessWidget {
  final int _index;

  _DetailsItem({Key key, @required index})
      : _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<DetailsBloc, Detail>(
      (value) => value.details[_index],
    );
    return Container(
      constraints: BoxConstraints(
        minHeight: 72,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  item.formattedAmount,
                  style: Theme.of(context).textTheme.subtitle1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                item.formattedCreatedAt,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            item.title,
            style: Theme.of(context).textTheme.caption,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

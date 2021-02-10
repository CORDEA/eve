import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

class _AccountSectionLabel extends StatelessWidget {
  final String text;

  const _AccountSectionLabel({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}

class _AccountItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final GestureTapCallback onTap;

  const _AccountItem({
    Key key,
    this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.caption,
      ),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => Account());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: ListView(
        children: [
          _AccountSectionLabel(text: 'Emergency'),
          _AccountItem(
            title: 'Stop using card',
            onTap: () {},
          ),
          _AccountItem(
            title: 'Report abuse',
            onTap: () {},
          ),
          _AccountSectionLabel(text: 'Procedure'),
          _AccountItem(
            title: 'Confirm/Update your information',
            onTap: () {},
          ),
          _AccountItem(
            title: 'Update password',
            onTap: () {},
          ),
          _AccountItem(
            title: 'Confirm/Update notification settings',
            onTap: () {},
          ),
          _AccountItem(
            title: 'Confirm/Update usage limit',
            onTap: () {},
          ),
          _AccountItem(
            title: 'Apply for card reissue',
            onTap: () {},
          ),
          _AccountSectionLabel(text: 'About eve'),
          _AccountItem(
            title: 'Terms and conditions',
            onTap: () {},
          ),
          _AccountItem(
            title: 'Privacy policy',
            onTap: () {},
          ),
          _AccountSectionLabel(text: 'About this app'),
          _AccountItem(
            title: 'Open source licenses',
            onTap: () {},
          ),
          _AccountItem(
            title: 'Sign out',
            onTap: () {},
          ),
        ],
      ),
    );
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
  final GestureTapCallback onTap;

  const _AccountItem({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
      onTap: onTap,
    );
  }
}

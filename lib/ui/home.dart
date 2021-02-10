import 'dart:math';

import 'package:eve/bloc/home_bloc.dart';
import 'package:eve/models/notification.dart' as notification;
import 'package:eve/ui/account.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(context.read(), context.read()),
      child: _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeContent();
  }
}

class _HomeContent extends State<_Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: _HomeBackground(Theme.of(context).primaryColor),
          size: Size(400, 400),
        ),
        ListView(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Account',
                  onPressed: () {
                    Navigator.of(context).push(Account.route());
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: _HomeBalanceLabel(),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: _HomeBalanceDifferenceLabel(),
            ),
            const SizedBox(height: 32),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: _HomeAccountContent(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: _HomeNotifications(),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ],
    );
  }
}

class _HomeBackground extends CustomPainter {
  Paint _paint;

  _HomeBackground(Color color) {
    _paint = Paint()..color = color;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawArc(
      Rect.fromCircle(
        center: Offset.zero,
        radius: size.width,
      ),
      0,
      pi / 2,
      true,
      _paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HomeBalanceLabel extends StatelessWidget {
  const _HomeBalanceLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var balance = context.select<HomeBloc, String>(
      (value) => value.balance,
    );
    return Text(
      balance,
      style: Theme.of(context).textTheme.headline4.copyWith(
            color: Theme.of(context).textTheme.subtitle1.color,
          ),
    );
  }
}

class _HomeBalanceDifferenceLabel extends StatelessWidget {
  const _HomeBalanceDifferenceLabel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Selector<HomeBloc, bool>(
          selector: (_, bloc) => bloc.isPlusDifference,
          builder: (_, isPlus, __) => Icon(
            isPlus ? Icons.trending_up : Icons.trending_down,
            color: isPlus ? Colors.green : Colors.red,
          ),
        ),
        const SizedBox(width: 8),
        Selector<HomeBloc, String>(
          selector: (_, bloc) => bloc.difference,
          builder: (_, diff, __) => Text(
            diff,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}

class _HomeAccountContent extends StatelessWidget {
  const _HomeAccountContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Selector<HomeBloc, String>(
          selector: (_, bloc) => bloc.branch,
          builder: (_, text, __) => Text(
            text,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
        SizedBox(height: 2),
        Selector<HomeBloc, String>(
          selector: (_, bloc) => bloc.accountNumber,
          builder: (_, text, __) => Text(
            text,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        SizedBox(height: 4),
        Selector<HomeBloc, String>(
          selector: (_, bloc) => bloc.ownerName,
          builder: (_, text, __) => Text(
            text,
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}

class _HomeNotifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var count = context.select<HomeBloc, int>(
      (value) => value.notifications.length,
    );
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 8),
      itemCount: count,
      itemBuilder: (_, index) => _HomeNotificationItem(index: index),
    );
  }
}

class _HomeNotificationItem extends StatelessWidget {
  final int _index;

  const _HomeNotificationItem({Key key, @required index})
      : _index = index,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<HomeBloc, notification.Notification>(
      (value) => value.notifications[_index],
    );
    return ListTile(
      title: Text(
        item.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        item.body,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

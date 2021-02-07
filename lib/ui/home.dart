import 'dart:math';

import 'package:eve/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeBloc(context.read()),
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
    context.read<HomeBloc>().fetchAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: _HomeBackground(Theme.of(context).primaryColor),
          size: Size.infinite,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Account',
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              child: _HomeBalanceLabel(),
            ),
            const SizedBox(height: 32),
            const SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: _HomeAccountContent(),
                  ),
                ),
              ),
            ),
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

class _HomeNotificationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(''),
      subtitle: Text(''),
    );
  }
}

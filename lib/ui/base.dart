import 'package:eve/bloc/base_bloc.dart';
import 'package:eve/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Base extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BaseBloc(),
      child: _Base(),
    );
  }
}

class _Base extends StatelessWidget {
  static final List<Widget> _contents = [
    Home(),
  ];

  @override
  Widget build(BuildContext context) {
    var index = context.select<BaseBloc, int>((value) => value.index);
    return Scaffold(
      appBar: AppBar(
        title: const Text('eve'),
      ),
      body: _contents[index],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        currentIndex: index,
        onTap: context.read<BaseBloc>().onBottomBarTapped,
      ),
    );
  }
}

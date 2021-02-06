import 'package:eve/bloc/base_bloc.dart';
import 'package:eve/ui/details.dart';
import 'package:eve/ui/home.dart';
import 'package:eve/ui/transfer.dart';
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
    Details(),
    Transfer(),
  ];

  @override
  Widget build(BuildContext context) {
    var bloc = context.watch<BaseBloc>();
    return Scaffold(
      appBar: bloc.shouldShowAppBar ? AppBar(
        title: const Text('eve'),
      ) : null,
      body: _contents[bloc.index],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_atm),
            label: 'Transfer',
          ),
        ],
        currentIndex: bloc.index,
        onTap: context.read<BaseBloc>().onBottomBarTapped,
      ),
    );
  }
}

import 'package:eve/bloc/details_bloc.dart';
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
    return Center();
  }
}

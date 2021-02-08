import 'package:eve/models/detail.dart';
import 'package:eve/repositories/detail_repository.dart';
import 'package:flutter/foundation.dart';

class DetailsBloc extends ChangeNotifier {
  final DetailRepository _repository;

  List<Detail> _details = [];

  DetailsBloc(this._repository);

  List<Detail> get details => _details;

  void fetch() {
    _repository.findAll().then((value) {
      _details = value;
      notifyListeners();
    }).catchError(() {
      _details = [];
      notifyListeners();
    });
  }
}

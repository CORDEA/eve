import 'package:eve/models/account.dart';
import 'package:eve/repositories/account_repository.dart';
import 'package:flutter/foundation.dart';

class HomeBloc extends ChangeNotifier {
  final AccountRepository _repository;

  Account _account = Account.EMPTY;

  HomeBloc(this._repository);

  Account get account => _account;

  void fetchAccount() {
    _repository.find().then((value) {
      _account = value;
      notifyListeners();
    }).catchError(() {
      _account = Account.EMPTY;
      notifyListeners();
    });
  }
}

import 'package:eve/models/account.dart';
import 'package:eve/repositories/account_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TransferBloc extends ChangeNotifier {
  final AccountRepository _repository;
  Account _account = Account.EMPTY;

  TransferBloc(this._repository);

  String get branch => _account.branchCode + ' ' + _account.branchName;

  String get ownerName => _account.ownerName;

  String get accountNumber => _account.number;

  void fetch() {
    _repository.find().then((value) {
      _account = value;
      notifyListeners();
    }).catchError(() {
      _account = Account.EMPTY;
      notifyListeners();
    });
  }
}

import 'package:eve/models/account.dart';
import 'package:eve/repositories/account_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class HomeBloc extends ChangeNotifier {
  static final NumberFormat _formatter = NumberFormat('#,###', 'ja_JP');

  final AccountRepository _repository;

  Account _account = Account.EMPTY;

  HomeBloc(this._repository);

  String get balance => _account.isBalanceAvailable
      ? '¥' + _formatter.format(_account.balance)
      : '-';

  String get branch => _account.branchCode + ' ' + _account.branchName;

  String get ownerName => _account.ownerName;

  String get accountNumber => _account.number;

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

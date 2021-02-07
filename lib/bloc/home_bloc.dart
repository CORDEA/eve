import 'package:eve/models/account.dart';
import 'package:eve/models/notification.dart';
import 'package:eve/repositories/account_repository.dart';
import 'package:eve/repositories/notification_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class HomeBloc extends ChangeNotifier {
  static final NumberFormat _formatter = NumberFormat('#,###', 'ja_JP');

  final AccountRepository _accountRepository;
  final NotificationRepository _notificationRepository;

  Account _account = Account.EMPTY;
  List<Notification> _notifications = [];

  HomeBloc(this._accountRepository, this._notificationRepository);

  String get balance => _account.isBalanceAvailable
      ? '¥' + _formatter.format(_account.balance)
      : '-';

  String get branch => _account.branchCode + ' ' + _account.branchName;

  String get ownerName => _account.ownerName;

  String get accountNumber => _account.number;

  List<Notification> get notifications => _notifications;

  void fetch() {
    Future.wait([
      _accountRepository.find(),
      _notificationRepository.findAll(),
    ]).then((values) {
      _account = values[0];
      _notifications = values[1];
      notifyListeners();
    }).catchError(() {
      _account = Account.EMPTY;
      _notifications = [];
      notifyListeners();
    });
  }
}

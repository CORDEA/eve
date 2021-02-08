import 'package:eve/models/balance.dart';

class Account {
  static const EMPTY = Account('', '', '', '', Balance.EMPTY);

  final String number;
  final String ownerName;
  final String branchCode;
  final String branchName;
  final Balance balance;

  const Account(
    this.number,
    this.ownerName,
    this.branchCode,
    this.branchName,
    this.balance,
  );

  bool get isBalanceAvailable => balance.balance >= 0;
}

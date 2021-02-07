class Account {
  static const EMPTY = Account('', '', '', '', -1);

  final String number;
  final String ownerName;
  final String branchCode;
  final String branchName;
  final double balance;

  const Account(
    this.number,
    this.ownerName,
    this.branchCode,
    this.branchName,
    this.balance,
  );

  bool get isBalanceAvailable => balance >= 0;
}

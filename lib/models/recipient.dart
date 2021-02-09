class Recipient {
  final String name;
  final String bankCode;
  final String bankName;
  final String bankBranchCode;
  final String bankBranchName;
  final String accountNumber;
  final bool isMarked;

  Recipient(
    this.name,
    this.bankCode,
    this.bankName,
    this.bankBranchCode,
    this.bankBranchName,
    this.accountNumber,
    this.isMarked,
  );
}

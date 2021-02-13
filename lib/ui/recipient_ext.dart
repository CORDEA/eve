import 'package:eve/models/recipient.dart';

extension RecipientExt on Recipient {
  String get formattedBankName => bankName + ' ' + bankBranchName;
}

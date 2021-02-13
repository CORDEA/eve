import 'package:eve/models/recipient.dart';
import 'package:flutter/foundation.dart';

class NewRecipientBloc extends ChangeNotifier {
  String _bankCode = '';
  String _branchCode = '';
  String _accountNumber = '';
  String _name = '';

  Recipient _recipient;

  Recipient get recipient => _recipient;

  void onBankCodeChanged(String text) {
    _bankCode = text;
  }

  void onBranchCodeChanged(String text) {
    _branchCode = text;
  }

  void onAccountNumberChanged(String text) {
    _accountNumber = text;
  }

  void onNameChanged(String text) {
    _name = text;
  }

  void submit() {
    // TODO
    _recipient = Recipient(
      _name,
      _bankCode,
      '',
      _branchCode,
      '',
      _accountNumber,
      false,
    );
    notifyListeners();
  }
}

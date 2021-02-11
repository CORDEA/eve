import 'package:flutter/foundation.dart';

class NewRecipientBloc extends ChangeNotifier {
  String _bankCode = '';
  String _branchCode = '';
  String _accountNumber = '';
  String _name = '';

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
  }
}

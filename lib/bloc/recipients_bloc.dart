import 'package:eve/models/recipient.dart';
import 'package:eve/repositories/recipient_repository.dart';
import 'package:flutter/foundation.dart';

class RecipientsBloc extends ChangeNotifier {
  final RecipientRepository _repository;

  List<Recipient> _recipients = [];

  RecipientsBloc(this._repository);

  int get numberOfPastRecipients =>
      _recipients.where((element) => !element.isMarked).length;

  int get numberOfStarredRecipients =>
      _recipients.where((element) => element.isMarked).length;

  List<Recipient> get recipients => _recipients;

  void fetch() {
    _repository.findAll().then((value) {
      _recipients = value;
      notifyListeners();
    }).catchError(() {
      _recipients = [];
      notifyListeners();
    });
  }
}

extension RecipientExt on Recipient {
  String get formattedBankName => bankName + ' ' + bankBranchName;
}

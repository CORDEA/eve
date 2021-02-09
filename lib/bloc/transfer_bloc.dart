import 'package:eve/models/recipient.dart';
import 'package:eve/repositories/recipient_repository.dart';
import 'package:flutter/foundation.dart';

class TransferBloc extends ChangeNotifier {
  final RecipientRepository _repository;

  List<Recipient> _recipients = [];

  TransferBloc(this._repository);

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

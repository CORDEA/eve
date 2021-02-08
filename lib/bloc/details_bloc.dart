import 'package:eve/models/detail.dart';
import 'package:eve/repositories/detail_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class DetailsBloc extends ChangeNotifier {
  final DetailRepository _repository;

  List<Detail> _details = [];

  DetailsBloc(this._repository);

  List<Detail> get details => _details;

  void fetch() {
    _repository.findAll().then((value) {
      _details = value;
      notifyListeners();
    }).catchError(() {
      _details = [];
      notifyListeners();
    });
  }
}

extension DetailExt on Detail {
  static final NumberFormat _amountFormatter = NumberFormat('#,###', 'ja_JP');
  static final DateFormat _dateFormatter = DateFormat.yMMMd();

  String get formattedAmount => '¥' + _amountFormatter.format(amount);

  String get formattedCreatedAt => _dateFormatter.format(createdAt);
}

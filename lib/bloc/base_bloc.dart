import 'package:flutter/foundation.dart';

class BaseBloc extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void onBottomBarTapped(int index) {
    if (_index == index) {
      return;
    }
    _index = index;
    notifyListeners();
  }
}

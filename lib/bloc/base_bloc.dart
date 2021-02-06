import 'package:flutter/foundation.dart';

class BaseBloc extends ChangeNotifier {
  int _index = 0;
  bool _shouldShowAppBar = false;

  int get index => _index;

  bool get shouldShowAppBar => _shouldShowAppBar;

  void onBottomBarTapped(int index) {
    if (_index == index) {
      return;
    }
    _index = index;
    _shouldShowAppBar = _index != 0;
    notifyListeners();
  }
}

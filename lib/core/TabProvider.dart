import 'package:flutter/foundation.dart';

class TabProvider with ChangeNotifier {
  int _currentTab = 0;

  int get getCurrentTab => _currentTab;

  setCurrentTab(int value) {
    _currentTab = value;
    notifyListeners();
  }
}

class PlayProvider with  ChangeNotifier{
  bool _play = true;

  bool get play => _play;

  set play(bool value) {
    _play = value;
    notifyListeners();
  }
}

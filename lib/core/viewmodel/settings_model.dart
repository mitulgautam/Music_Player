import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/viewmodel/base_model.dart';

class SettingsModel extends BaseModel {
  bool _optimisePlayback = false;
  bool _dataSavingMode = false;
  Color _primary;
  Color _secondry;
  int _darkMode = 0;

  int get darkMode => _darkMode;

  set darkMode(int value) {
    _darkMode = value;
    notifyListeners();
  }

  Color getTextColor() {
    return darkMode == 1 ? Colors.white : Colors.black;
  }

  Color getWidgetColor() {
    return darkMode == 1 ? Colors.grey : Colors.white;
  }

  Color get primary => _primary;

  set primary(Color value) {
    _primary = value;
    notifyListeners();
  }

  Color get secondry => _secondry;

  set secondry(Color value) {
    _secondry = value;
    notifyListeners();
  }

  bool get optimisePlayback => _optimisePlayback;

  set optimisePlayback(bool value) {
    _optimisePlayback = value;
    notifyListeners();
  }

  bool get dataSavingMode => _dataSavingMode;

  set dataSavingMode(bool value) {
    _dataSavingMode = value;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}

import 'package:flutter/foundation.dart';

class SettingsModel with ChangeNotifier {
  bool _optimisePlayback = false;
  bool _dataSavingMode = false;

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
}

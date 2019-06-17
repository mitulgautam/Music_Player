import 'package:flutter/foundation.dart';
import 'package:flutter_musically_app/core/enum/play_state.dart';

class MusicModel extends ChangeNotifier {
  PlayState _isPlaying = PlayState.stopped;
  int _currentTab = 0;

  int get currentTab => _currentTab;

  set currentTab(int value) {
    _currentTab = value;
    notifyListeners();
  }

  PlayState get isPlaying => _isPlaying;

  set isPlaying(PlayState value) {
    _isPlaying = value;
    notifyListeners();
  }
}

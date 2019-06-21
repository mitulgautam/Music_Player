import 'dart:math';

import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter_musically_app/core/enum/play_state.dart';
import 'package:flutter_musically_app/core/enum/view_state.dart';
import 'package:flutter_musically_app/resources/constant.dart';

import 'base_model.dart';

class MusicModel extends BaseModel {
  PlayState _isPlaying = PlayState.stopped;
  int _currentTab = 1;

  int get currentTab => _currentTab;

  set currentTab(int value) {
    state = ViewState.Busy;
    _currentTab = value;
    state = ViewState.Idle;
  }

  PlayState get isPlaying => _isPlaying;

  set isPlaying(PlayState value) {
    state = ViewState.Busy;
    _isPlaying = value;
    state = ViewState.Idle;
    print(_isPlaying);
  }

  //music player setup
  MusicFinder _musicFinder;

  MusicFinder get musicFinder => _musicFinder;
  List<Song> _songList = [];

  List<Song> get songList => _songList;

  int get length => songList.length;

  set songList(List<Song> value) {
    state = ViewState.Busy;
    _songList = value;
    state = ViewState.Idle;
  }

  Duration _duration = Duration(seconds: 0);
  Duration _position = Duration(seconds: 0);

  Duration get duration => _duration;

  set duration(Duration value) {
    _duration = value;
    notifyListeners();
  }

  Duration get position => _position;

  set position(Duration value) {
    _position = value;
    notifyListeners();
  }

  //current image
  // ignore: unused_field
  String _currentImage = '';

  String get currentImage =>
      Data.imageplayer[length == 0 ? 0 : (currentSong) % (length)];

  //init player

  initPlayer() {
    state = ViewState.Busy;
    _musicFinder = MusicFinder();
    state = ViewState.Idle;
    //error handling methods
    musicFinder.setCompletionHandler(() {
      isPlaying = PlayState.stopped;
      duration = Duration(seconds: 0);
      position = Duration(seconds: 0);
      repeat == true
          ? play(songList[currentSong - 1])
          : random == true
          ? playRandom()
          : currentSong <= length ? nextSong() : print('last song');
    });
    musicFinder.setDurationHandler((d) {
      _duration = d;
    });
    musicFinder.setPositionHandler((p) {
      position = p;
    });
  }

  fetchSongs() {
    state = ViewState.Busy;
    Future songs = MusicFinder.allSongs();
    songs.then((fetchedSong) {
      _songList = List.from(fetchedSong);
      state = ViewState.Idle;
    });
  }

//play pause stop repeat random
  bool _random = false;
  bool _repeat = false;

  bool get random => _random;

  set random(bool value) {
    _random = value;
    print('random $random');
    notifyListeners();
  }

  bool get repeat => _repeat;

  set repeat(bool value) {
    _repeat = value;
    print('repeat $repeat');
    notifyListeners();
  }

  void play(Song song) {
    state = ViewState.Busy;
    if (isPlaying == PlayState.playing) {
      stop();
    }
    if (song != null) {
      Future result = musicFinder.play(song.uri, isLocal: true);
      result.then((value) {
        isPlaying = PlayState.playing;
      });
    }
    state = ViewState.Idle;
  }

  void playRandom() {
    state = ViewState.Busy;
    if (isPlaying == PlayState.playing || isPlaying == PlayState.paused) {
      stop();
    }
    int randomSong = Random().nextInt(songList.length);

    Future result = musicFinder.play(songList[randomSong].uri, isLocal: true);
    result.then((value) {
      currentSong = randomSong;
      print('random $currentSong');
      isPlaying = PlayState.playing;
    });

    state = ViewState.Idle;
  }

  double _pauseSeek = 0.0;

  double get pauseSeek => _pauseSeek;

  set pauseSeek(double value) {
    _pauseSeek = value;
  }

  void pause() {
    state = ViewState.Busy;
    Future result = musicFinder.pause();
    result.then((value) {
      isPlaying = PlayState.paused;
    });
    state = ViewState.Idle;
  }

  void stop() {
    state = ViewState.Busy;
    Future result = musicFinder.stop();
    result.then((value) {
      isPlaying = PlayState.stopped;
      duration = Duration(seconds: 0);
      position = Duration(seconds: 0);
    });
    state = ViewState.Idle;
  }

  //current next prev
  int _currentSong = -1;

  int get currentSong => _currentSong;

  set currentSong(int value) {
    state = ViewState.Busy;
    _currentSong = value;
    state = ViewState.Idle;
    print('CurrenSong $currentSong');
  }

  nextSong() {
    if (random == true)
      playRandom();
    else {
      play(songList[currentSong + 1]);
      currentSong = currentSong + 1;
    }
  }

  prevSong() {
    play(songList[currentSong - 1]);
    currentSong = currentSong - 1;
  }

  @override
  // ignore: must_call_super
  void dispose() {}
}

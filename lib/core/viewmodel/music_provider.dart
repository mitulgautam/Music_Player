import 'dart:io';
import 'dart:math';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/enum/play_state.dart';
import 'package:flutter_musically_app/resources/constant.dart';

import 'base_model.dart';

class MusicModel extends BaseModel {
  Duration _currentDuration = Duration(seconds: 0);
  Duration _currentPosition = Duration(seconds: 0);
  Duration _pauseSeek = Duration(seconds: 0);
  int _currentSong = -1;
  int _currentImage = 0;
  bool _repeatSong = false;
  bool _randomSong = false;
  int _currentTab = 1;
  List<Song> _songsList = [];
  MusicFinder _musicPlayer;
  PlayState _playState = PlayState.stopped;
  bool _mute = false;
  int _lengthList = 0;

  int get lengthList => _lengthList;

  set lengthList(int value) {
    _lengthList = value;
    notifyListeners();
  }

  bool get mute => _mute;

  set mute(bool value) {
    _mute = value;
    notifyListeners();
  }

  Duration get pauseSeek => _pauseSeek;

  set pauseSeek(Duration value) {
    _pauseSeek = value;
    notifyListeners();
  }

  PlayState get playState => _playState;

  set playState(PlayState value) {
    _playState = value;
    notifyListeners();
  }

  MusicFinder get musicPlayer => _musicPlayer;

  Duration get currentDuration => _currentDuration;

  set currentDuration(Duration value) {
    _currentDuration = value;
    notifyListeners();
  }

  String _playTime = '0:00';

  Duration get currentPosition => _currentPosition;

  set currentPosition(Duration value) {
    _currentPosition = value;
    notifyListeners();
  }

  int get currentSong => _currentSong;

  setCurrentSong(int value) {
    _currentSong = value;
    print("Current Index: $value");
    notifyListeners();
  }

  int get currentImage => _currentImage;

  set currentImage(int value) {
    _currentImage = value;
    notifyListeners();
  }

  bool get repeatSong => _repeatSong;

  set repeatSong(bool value) {
    _repeatSong = value;
    notifyListeners();
  }

  bool get randomSong => _randomSong;

  set randomSong(bool value) {
    _randomSong = value;
    notifyListeners();
  }

  int get currentTab => _currentTab;

  set currentTab(int value) {
    _currentTab = value;
    notifyListeners();
  }

  List<Song> get songsList => _songsList;

  set songsList(List<Song> value) {
    _songsList = value;
    notifyListeners();
  }

  String get playTime => _playTime;

  set playTime(String value) {
    _playTime = value;
    notifyListeners();
  }

  initPlayer() {
    _musicPlayer = MusicFinder();
    musicPlayer.setPositionHandler((p) {
      currentPosition = p;
    });
    musicPlayer.setDurationHandler((d) {
      currentDuration = d;
    });
    musicPlayer.setErrorHandler((error) {
      print('Error: $error');
    });
    musicPlayer.setCompletionHandler(() {
      onCompleteHandler();
    });
    musicPlayer.setStartHandler(() {});
    fetchSong();
    print(lengthList);
  }

  fetchSong() async {
    var songFetched = await MusicFinder.allSongs();
    songsList = List.from(songFetched);
    lengthList = songsList.length;
  }

  void onCompleteHandler() {
    //need to be implemented
    playState = PlayState.stopped;
    repeatSong == true
        ? play()
        : randomSong == true ? playRandom() : skipNext();
  }

  void play() {
    if (playState == PlayState.playing) {
      pause();
    } else if (playState == PlayState.paused) {
      resume();
    } else if (playState == PlayState.stopped) {
      currentSong == -1
          ? playRandom()
          : musicPlayer
              .play(songsList[currentSong].uri, isLocal: true)
              .then((value) {
              print("Played: $value");
              playState = PlayState.playing;
            });
    }
  }

  void tapPlay(int index) {
    setCurrentSong(index);
    playState == PlayState.playing || PlayState.paused == playState
        ? stop()
        : print('not playing');
    musicPlayer.play(songsList[currentSong].uri, isLocal: true).then((value) {
      print("Played: $value");
      playState = PlayState.playing;
    });
  }

  void pause() {
    Future response = musicPlayer.pause();
    response.then((value) {
      print("Paused: $value");
      playState = PlayState.paused;
      pauseSeek = currentPosition;
    });
    notifyListeners();
  }

  void resume() {
    Future response =
        musicPlayer.play(songsList[currentSong].uri, isLocal: true);
    response.then((value) {
      print("Resumed: $value");
      musicPlayer.seek(pauseSeek.inSeconds.toDouble());
      playState = PlayState.playing;
    });
    notifyListeners();
  }

  void stop() async {
    await musicPlayer.stop();
    print("Stopped");
    currentDuration = Duration(seconds: 0);
    currentPosition = Duration(seconds: 0);
    playState = PlayState.stopped;
    notifyListeners();
  }

  void skipNext() {
    print('Skipping');
    if (randomSong == true) {
      playRandom();
      print('random');
    } else if (currentSong < (lengthList - 1)) {
      print('set');
      tapPlay(currentSong + 1);
    }
  }

  void skipPrev() {
    if (randomSong == true) {
      playRandom();
    } else if (currentSong == 0) {
      print("No prev song available!");
    } else if (currentSong > 0) {
      tapPlay(currentSong - 1);
    }
  }

  void playRandom() {
    print(songsList.length);
    if (songsList.length > 0) {
      int temp = Random().nextInt(songsList.length);
      print('Random Value: $temp');
      tapPlay(temp);
    }
  }

  void mutePlayer() {
    mute = !mute;
    Future response = musicPlayer.mute(mute);
    response.then((value) {
      //if need then implement
    });
  }

  String currentTitle() {
    return currentSong == -1 ? '' : songsList[currentSong].title;
  }

  String currentArtist() {
    return currentSong == -1 ? '' : songsList[currentSong].artist;
  }

  String playerImage() {
    //need to be implemented for every song
    return Data.imageplayer[0];
  }

  seekSong(double value) {
    musicPlayer.seek(value * currentDuration.inSeconds);
  }

  double progressBar() {
    return currentSong == -1
        ? 0
        : currentDuration == Duration(seconds: 0)
            ? 0
            : (currentPosition.inSeconds / currentDuration.inSeconds);
  }

  File getSongImage(int index) {
    return songsList[index].albumArt == null
        ? null
        : File.fromUri(Uri.parse(songsList[index].albumArt));
  }

  dynamic getPlayerImage() {
    return currentSong == -1
        ? AssetImage(Data.imageplayer[3])
        : getSongImage(currentSong) == null
            ? AssetImage(Data.imageplayer[0])
            : FileImage(getSongImage(currentSong));
  }

  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
  }

  bool darkThemeMode(BuildContext context) {
    MediaQuery.of(context).platformBrightness == Brightness.dark
        ? darkTheme = true
        : darkTheme = false;
    notifyListeners();
    return darkTheme;
  }

// ignore: must_call_super
  void dispose() {}
}

import 'package:flutter_musically_app/core/model/song.dart';
import 'package:flutter_musically_app/resources/constant.dart';

class SongData {
  static SongList fetchData() {
    return SongList(Data.image, Data.heading_music);
  }
}

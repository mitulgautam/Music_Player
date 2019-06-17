import 'package:flutter_musically_app/core/model/song.dart';
import 'package:flutter_musically_app/core/services/song_data.dart';

class Repository {
  SongList getData() {
    SongList list = SongData.fetchData();
    return list;
  }
}

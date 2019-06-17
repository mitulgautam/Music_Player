class Song {
  final List<String> _images;
  final List<String> _music;

  Song(this._images, this._music);

  List<String> get music => _music;

  List<String> get images => _images;
}

class SongList {
  List<Song> _song = [];

  List<Song> get song => _song;

  SongList(List<List<String>> images, List<List<String>> music) {
    for (int i = 0; i < images.length; i++) {
      Song temp = Song(images[i], music[i]);
      _song.add(temp);
    }
  }
}

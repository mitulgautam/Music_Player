import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/viewmodel/music_provider.dart';
import 'package:flutter_musically_app/resources/theme.dart';
import '../../locator.dart';
import 'base_view.dart';

Size size;

class Music extends StatefulWidget {
  const Music({Key key}) : super(key: key);

  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  MusicModel modelLocator = locator<MusicModel>();

  @override
  void initState() {
    modelLocator.initPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: BaseView<MusicModel>(
      builder: (context, model, _) => model.songsList == null
          ? Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                  Text('Loading...'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: model.songsList.length,
              itemBuilder: (context, index) {
                var file = model.songsList[index].albumArt == null
                    ? null
                    : File.fromUri(Uri.parse(model.songsList[index].albumArt));
                return _musicCard(file, model.songsList[index].title, index);
              },
            ),
    ));
  }

  Widget _musicCard(var file, String title, int index) {
    return InkWell(
      onTap: () {
        modelLocator.tapPlay(index);
      },
      child: Card(
        color: modelLocator.currentSong == index
            ? Colors.redAccent.shade100
            : Colors.white,
        margin: EdgeInsets.all(4.0),
        elevation: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: size.width / 5,
                height: size.width / 5,
                child: file == null
                    ? CircleAvatar(
                        backgroundColor: CustomTheme.red,
                        child: Text(title[0]),
                      )
                    : Image.file(file),
              ),
            ),
            Expanded(
                child: Text(
              title,
              style: TextStyle(fontSize: 24.0),
            )),
          ],
        ),
      ),
    );
  }
}

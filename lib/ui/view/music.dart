import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/viewmodel/music_provider.dart';
import 'package:flutter_musically_app/resources/constant.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';
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
    Color textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.white
            : Colors.black;
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
                return _musicCard(
                    model.getSongImage(index),
                    model.songsList[index].title,
                    index,
                    model.songsList[index].artist,
                    textColor);
              },
            ),
    ));
  }

  Widget _musicCard(
      var file, String title, int index, String artist, Color color) {
    return InkWell(
      onTap: () {
        modelLocator.tapPlay(index);
      },
      child: Card(
        margin: EdgeInsets.all(4.0),
        elevation: 0.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height / 8,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: modelLocator.currentSong == index
                      ? [Colors.amber.shade50, Colors.deepOrange.shade300]
                      : [Colors.transparent, Colors.transparent],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: size.width / 8,
                    height: size.width / 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(size.width / 8),
                      child: file == null
                          ? CircleAvatar(
                              child: Image.asset(Data.imageplayer[index % 4]),
                            )
                          : Image.file(file),
                    ),
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style:
                          CustomFontStyle.medium_bold_gothic(size.width, color),
                    ),
                    Text(
                      artist,
                      style: TextStyle(
                          fontSize: size.width / 44,
                          fontFamily: 'Gothic',
                          color: Colors.grey),
                    )
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/enum/play_state.dart';
import 'package:flutter_musically_app/core/viewmodel/music_provider.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';
import 'package:flutter_musically_app/resources/theme.dart';

import 'base_view.dart';
import 'package:marquee/marquee.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color textColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? Colors.white
            : Colors.black;
    Size size = MediaQuery.of(context).size;
    return BaseView<MusicModel>(
      builder: (context, model, _) => Scaffold(
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                          height: size.height / 1.6,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: model.getPlayerImage(),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.centerLeft)),
                          child: Container(
                            height: size.height,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      textColor != Colors.white
                                          ? Colors.white
                                          : Colors.black
                                    ],
                                    begin: Alignment.topCenter,
                                    stops: [0, 1],
                                    end: Alignment.bottomCenter)),
                          )),
                      Container(
                        margin: EdgeInsets.only(top: 16.0),
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: size.width / 16,
                                  color: Colors.white,
                                )),
                            Icon(
                              Icons.favorite,
                              size: size.width / 16,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color:
                        textColor == Colors.white ? Colors.black : Colors.white,
                    height: 32.0,
                  ),
                  Expanded(
                    child: Container(
                      color: textColor == Colors.white
                          ? Colors.black
                          : Colors.white,
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    model.randomSong = !model.randomSong;
                                  },
                                  child: Icon(
                                    Icons.shuffle,
                                    color: model.randomSong
                                        ? CustomTheme.red
                                        : Colors.black,
                                    size: size.width / 18,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    model.skipPrev();
                                  },
                                  child: Icon(
                                    Icons.skip_previous,
                                    size: size.width / 11,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    model.play();
                                  },
                                  child: Icon(
                                    model.playState == PlayState.playing
                                        ? Icons.pause_circle_filled
                                        : Icons.play_circle_filled,
                                    color: CustomTheme.red,
                                    size: size.width / 6,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    model.skipNext();
                                  },
                                  child: Icon(
                                    Icons.skip_next,
                                    size: size.width / 11,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    model.repeatSong = !model.repeatSong;
                                  },
                                  child: Icon(Icons.repeat,
                                      size: size.width / 18,
                                      color: model.repeatSong
                                          ? CustomTheme.red
                                          : Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: size.height / 16,
                            padding: const EdgeInsets.only(
                                top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                            child: Marquee(
                              text: model.currentTitle(),
                              style: CustomFontStyle.medium_bold_gothic(
                                  size.width * 1.4, textColor),
                              scrollAxis: Axis.horizontal,
                              blankSpace: 20.0,
                              velocity: 100.0,
                            ),
                          ),
                          Text(
                            model.currentArtist(),
                            style: CustomFontStyle.small_bold_gothic(
                                size.width * 1.5, textColor),
                          ),
                          SizedBox(
                            height: size.height / 24,
                          ),
                          Slider(
                            onChanged: model.seekSong,
                            value: model.progressBar(),
                            activeColor: CustomTheme.red,
                            inactiveColor: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}

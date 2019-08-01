import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/enum/play_state.dart';
import 'package:flutter_musically_app/core/viewmodel/music_provider.dart';
import 'package:flutter_musically_app/core/viewmodel/settings_model.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';
import 'package:flutter_musically_app/resources/theme.dart';

import 'base_view.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BaseView<SettingsModel>(
      builder: (_, colorModel, __) => BaseView<MusicModel>(
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
                                    colorModel.getTextColor() != Colors.white
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
                  color: colorModel.getTextColor() == Colors.white
                      ? Colors.black
                      : Colors.white,
                  height: 32.0,
                ),
                Expanded(
                  child: Container(
                    color: colorModel.getTextColor() == Colors.white
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
                                      ? colorModel.primary
                                      : colorModel.getTextColor(),
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
                                  color: colorModel.getTextColor(),
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
                                  color: colorModel.primary,
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
                                  color: colorModel.getTextColor(),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  model.repeatSong = !model.repeatSong;
                                },
                                child: Icon(
                                  Icons.repeat,
                                  size: size.width / 18,
                                  color: model.repeatSong
                                      ? colorModel.primary
                                      : colorModel.getTextColor(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: size.height / 16,
                          padding: const EdgeInsets.only(
                              top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                          child: Text(
                            model.currentTitle(),
                            style: CustomFontStyle.medium_bold_gothic(
                                size.width * 1.4, colorModel.getTextColor()),
                          ),
                        ),
                        Text(
                          model.currentArtist(),
                          style: CustomFontStyle.small_bold_gothic(
                              size.width * 1.5, colorModel.getTextColor()),
                        ),
                        Slider(
                          onChanged: model.seekSong,
                          value: model.progressBar(),
                          activeColor: colorModel.primary,
                          inactiveColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

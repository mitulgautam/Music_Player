import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/enum/play_state.dart';
import 'package:flutter_musically_app/core/services/repository.dart';
import 'package:flutter_musically_app/core/viewmodel/music_provider.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';
import 'package:flutter_musically_app/resources/theme.dart';
import 'package:flutter_musically_app/ui/view/home.dart';
import 'package:flutter_musically_app/ui/view/music.dart';
import 'package:flutter_musically_app/ui/view/search.dart';
import 'package:flutter_musically_app/ui/view/setting.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _children = [Home(), Music(), Search(), Setting()];
  int currentTab = 0;
  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    MusicModel model = Provider.of<MusicModel>(context);
    final width = MediaQuery.of(context).size.width;
    final Size size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;

    print(size.width.toString());
    print(size.height.toString());
    return Scaffold(
        body: _children[model.currentTab],
        backgroundColor: Colors.white,
        bottomNavigationBar: Wrap(
          children: <Widget>[
            Wrap(
              children: <Widget>[
                Container(
                  color: CustomTheme.gray,
                  height: size.height / 19,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: size.height / 18,
                          height: size.height / 18,
                          child: Image.asset(
                            repository.getData().song[1].images[1],
                            alignment: Alignment.centerLeft,
                            fit: BoxFit.cover,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              repository.getData().song[1].music[1],
                              style: CustomFontStyle.small_bold_gothic(
                                  size.width),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                    width: size.width,
                    height: 6.0,
                    child: LinearProgressIndicator(
                      value: .21,
                      backgroundColor: CustomTheme.gray,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(CustomTheme.red),
                    )),
              ],
            ),
            BottomNavigationBar(
              showUnselectedLabels: true,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                if (index < 2)
                  model.currentTab = index;
                else if (index == 2) {
                  //need to be changed
                  model.isPlaying == PlayState.paused ||
                          model.isPlaying == PlayState.stopped
                      ? model.isPlaying = PlayState.playing
                      : model.isPlaying = PlayState.paused;
                  print('hello');
                } else if (index > 2) {
                  if (index == 3) {
                    Navigator.of(context).pushNamed('/search');
                  } else if (index == 4) {
                    Navigator.pushNamed(context, '/setting');
                  }
                }
              },
              backgroundColor: Colors.transparent,
              selectedItemColor: CustomTheme.red,
              unselectedItemColor: CustomTheme.gray,
              items: [
                BottomNavigationBarItem(
                    backgroundColor: Colors.white,
                    icon: Icon(
                      Icons.home,
                      size: width / 16,
                    ),
                    title: Text(
                      'Home',
                      style:
                          CustomFontStyle.very_small_bold_gothic_no_color(
                              size.width),

                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.library_music,
                      size: width / 16,
                    ),
                    title: Text(
                      'Music',
                      style:
                          CustomFontStyle.very_small_bold_gothic_no_color(
                              size.width),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      model.isPlaying == PlayState.paused ||
                              model.isPlaying == PlayState.stopped
                          ? Icons.play_circle_filled
                          : Icons.pause_circle_filled,
                      size: width / 8,
                      color: CustomTheme.red,
                    ),
                    title: Container(
                      height: 4.0,
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.search,
                      size: width / 16,
                    ),
                    title: Text(
                      'Search',
                      style:
                          CustomFontStyle.very_small_bold_gothic_no_color(
                              size.width),
                    )),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                      size: width / 16,
                    ),
                    title: Text(
                      'Setting',
                      style:
                          CustomFontStyle.very_small_bold_gothic_no_color(
                              size.width),
                    ))
              ],
              currentIndex: model.currentTab,
            ),
          ],
        ));
  }
}

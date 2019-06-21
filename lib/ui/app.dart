import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/enum/play_state.dart';
import 'package:flutter_musically_app/core/services/repository.dart';
import 'package:flutter_musically_app/core/viewmodel/music_provider.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';
import 'package:flutter_musically_app/resources/theme.dart';
import 'package:flutter_musically_app/ui/view/base_view.dart';
import 'package:flutter_musically_app/ui/view/home.dart';
import 'package:flutter_musically_app/ui/view/music.dart';
import 'package:flutter_musically_app/ui/view/search.dart';
import 'package:flutter_musically_app/ui/view/setting.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Widget> _children = [
    Home(
      key: PageStorageKey('home'),
    ),
    Music(
      key: PageStorageKey('music'),
    ),
    Search(
      key: PageStorageKey('search'),
    ),
    Settings()
  ];
  Repository repository = Repository();
  PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final Size size = MediaQuery.of(context).size;
    return BaseView<MusicModel>(
      builder: (context, model, _) => Scaffold(
          body: PageStorage(
            child: _children[model.currentTab],
            bucket: bucket,
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: InkWell(
            onTap: () => Navigator.pushNamed(context, '/player'),
            child: Wrap(
              children: <Widget>[
                SizedBox(
                  height: size.height / 19,
                  //for mob
                ),
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
                                model.playerImage(),
                                alignment: Alignment.centerLeft,
                                fit: BoxFit.cover,
                              )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    model.currentTitle(),
                                    style: CustomFontStyle.small_bold_gothic(
                                        size.width),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.height / 15,
                            height: size.height / 18,
                            child: Text(
                                '${model.currentPosition.toString()} : ${model.currentDuration.toString()}'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: size.width,
                        height: 6.0,
                        child: LinearProgressIndicator(
                          value: model.progressBar(),
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
                      model.play();
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
                          model.playState == PlayState.playing
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
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
            ),
          )),
    );
  }
}

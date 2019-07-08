import 'package:flutter/material.dart';
import 'package:flutter_musically_app/resources/constant.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';
import 'package:flutter_musically_app/resources/theme.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

Color textColor;

class _SettingsState extends State<Settings> {
  Size size;

  @override
  Widget build(BuildContext context) {
    textColor = MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:
          textColor == Colors.black ? CustomTheme.gray : Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: textColor, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: CustomFontStyle.medium_bold_gothic(size.width, textColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textMedium('Profile'),
                ),
                Card(
                  elevation: 8.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: _textSmall('Edit Profile'),
                        ),
                        Row(
                          children: <Widget>[
                            ClipOval(
                                child: CircleAvatar(
                              maxRadius: size.width / 20,
                              minRadius: size.width / 20,
                              child: Image.network(
                                Data.profileImage,
                                fit: BoxFit.cover,
                              ),
                            )),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textMedium('Music & Playback'),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _textSmall('Streaming Quality'),
                              Text(
                                'HD',
                                style: CustomFontStyle
                                    .very_small_bold_gothic_no_color(
                                  size.width * 1.2,
                                ),
                              )
                            ],
                          ),
                        ),
                        _space(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _textSmall('Music Language'),
                              Text(
                                'English,Hindi',
                                style: CustomFontStyle
                                    .very_small_bold_gothic_no_color(
                                  size.width * 1.2,
                                ),
                              )
                            ],
                          ),
                        ),
                        _space(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _textSmall('Optimise Playback'),
                              Switch(
                                value: false,
                                onChanged: (value) {},
                                activeColor: CustomTheme.red,
                              )
                            ],
                          ),
                        ),
                        _space(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              _textSmall('Data Saving Mode'),
                              Switch(
                                value: true,
                                onChanged: (value) {},
                                activeColor: CustomTheme.red,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  elevation: 8.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textMedium('Night Mode'),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _boxRadio('assets/light.png'),
                        _boxRadio('assets/dark.png'),
                        _boxRadio('assets/auto.png')
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _textMedium('General'),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: _textSmall('Share App'),
                        ),
                        _space(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: _textSmall('Rate App'),
                        ),
                        _space(),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0, bottom: 12.0, left: 8.0, right: 8.0),
                          child: _textSmall('About Us'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _boxRadio(String image) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black26,
            child: SizedBox(
              width: size.width / 5,
              height: size.width / 5,
              child: Image.asset(image),
            ),
          ),
          Radio(
            value: image == 'assets/light.png' ? 1 : 0,
            groupValue: 1,
            onChanged: (value) {},
            activeColor: CustomTheme.red,
          )
        ],
      ),
    );
  }

  Widget _space() {
    return Container(
      padding: EdgeInsets.all(8.0),
      height: 1.0,
      color: Colors.black26,
      margin: EdgeInsets.only(left: 8.0, right: 8.0),
    );
  }

  Widget _textMedium(String text) {
    return Text(
      '$text',
      style: CustomFontStyle.medium_bold_gothic(size.width, textColor),
    );
  }

  Widget _textSmall(String text) {
    return Text(
      '$text',
      style: CustomFontStyle.small_bold_gothic(size.width * 1.2, textColor),
    );
  }
}

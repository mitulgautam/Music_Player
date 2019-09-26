import 'package:flutter/material.dart';
import 'package:musically/ui/shared/styles.dart';

import '../../SampleData.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Style.gray,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: Style.medium_bold_gothic(size.width),
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
                                style: Style.small_open_sans(size.width),
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
                                style: Style.small_open_sans(size.width),
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
                                activeColor: Style.red,
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
                                activeColor: Style.red,
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
                      children: <Widget>[_boxRadio(), _boxRadio(), _boxRadio()],
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

  Widget _boxRadio() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black26,
            child: SizedBox(
              width: size.width / 5,
              height: size.width / 5,
            ),
          ),
          Radio(value: 1, groupValue: null, onChanged: (value) {})
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
      style: Style.medium_bold_gothic(size.width / 1.09),
    );
  }

  Widget _textSmall(String text) {
    return Text(
      '$text',
      style: Style.small_bold_gothic(size.height / 1.3),
    );
  }
}

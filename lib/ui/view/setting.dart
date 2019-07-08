import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/viewmodel/settings_model.dart';
import 'package:flutter_musically_app/resources/constant.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';
import 'package:flutter_musically_app/resources/theme.dart';
import 'package:flutter_musically_app/ui/view/base_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Size size;
  var pref = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseView<SettingsModel>(
      builder: (_, model, __) => Scaffold(
            backgroundColor: model.getTextColor() == Colors.black
                ? CustomTheme.gray
                : Colors.black,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: model.getTextColor(), //change your color here
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              centerTitle: true,
              title: Text(
                'Settings',
                style: CustomFontStyle.medium_bold_gothic(
                    size.width, model.getTextColor()),
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
                        child: _textMedium('Profile', model.getTextColor()),
                      ),
                      Card(
                        color: model.getWidgetColor(),
                        elevation: 8.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: _textSmall(
                                    'Edit Profile', model.getTextColor()),
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
                        child: _textMedium(
                            'Music & Playback', model.getTextColor()),
                      ),
                      Card(
                        color: model.getWidgetColor(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0,
                                    bottom: 12.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    _textSmall('Streaming Quality',
                                        model.getTextColor()),
                                    _textSmall('HD', model.getTextColor())
                                  ],
                                ),
                              ),
                              _space(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0,
                                    bottom: 12.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    _textSmall(
                                        'Music Language', model.getTextColor()),
                                    _textSmall(
                                        'English,Hindi', model.getTextColor())
                                  ],
                                ),
                              ),
                              _space(),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    _textSmall('Optimise Playback',
                                        model.getTextColor()),
                                    Switch(
                                      value: false,
                                      onChanged: (value) {},
                                      activeColor: model.primary,
                                    )
                                  ],
                                ),
                              ),
                              _space(),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    _textSmall('Data Saving Mode',
                                        model.getTextColor()),
                                    Switch(
                                      value: true,
                                      onChanged: (value) {},
                                      activeColor: model.primary,
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
                        child: _textMedium('Themes', model.getTextColor()),
                      ),
                      Card(
                        color: model.getWidgetColor(),
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(8.0),
                            height: size.height / 8,
                            width: size.width,
                            child: ListView.builder(
                                itemCount: Data.primary.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, index) => _appTheme(
                                        Data.primary[index],
                                        Data.secondry[index], () {
                                      model.primary = Data.primary[index];
                                      model.secondry = Data.secondry[index];
                                      pref.then((cal) {
                                        cal.setString('theme', '$index');
                                      });
                                    }))),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _textMedium('Night Mode', model.getTextColor()),
                      ),
                      Card(
                        color: model.getWidgetColor(),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.black26,
                                      child: SizedBox(
                                        width: size.width / 5,
                                        height: size.width / 5,
                                        child: Image.asset('assets/light.png'),
                                      ),
                                    ),
                                    Radio(
                                      value: 0,
                                      groupValue: model.darkMode,
                                      onChanged: (value) {
                                        model.darkMode = 0;
                                        pref.then((_) {
                                          _.setString('colorMode', '0');
                                        });
                                      },
                                      activeColor: model.primary,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      color: Colors.black26,
                                      child: SizedBox(
                                        width: size.width / 5,
                                        height: size.width / 5,
                                        child: Image.asset('assets/dark.png'),
                                      ),
                                    ),
                                    Radio(
                                      value: 1,
                                      groupValue: model.darkMode,
                                      onChanged: (value) {
                                        model.darkMode = 1;
                                        pref.then((_) {
                                          _.setString('colorMode', '1');
                                        });
                                      },
                                      activeColor: model.primary,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _textMedium('General', model.getTextColor()),
                      ),
                      Card(
                        color: model.getWidgetColor(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0,
                                    bottom: 12.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: _textSmall(
                                    'Share App', model.getTextColor()),
                              ),
                              _space(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0,
                                    bottom: 12.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: _textSmall(
                                    'Rate App', model.getTextColor()),
                              ),
                              _space(),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 12.0,
                                    bottom: 12.0,
                                    left: 8.0,
                                    right: 8.0),
                                child: _textSmall(
                                    'About Us', model.getTextColor()),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
    );
  }

  Widget _appTheme(Color primary, Color secondry, VoidCallback colorCallback) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: colorCallback,
        child: CircleAvatar(
          minRadius: size.width / 16,
          maxRadius: size.width / 16,
          backgroundColor: primary,
          child: CircleAvatar(
            minRadius: size.width / 28,
            maxRadius: size.width / 28,
            backgroundColor: Colors.white54,
          ),
        ),
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

  Widget _textMedium(String text, Color color) {
    return Text(
      '$text',
      style: CustomFontStyle.medium_bold_gothic(size.width, color),
    );
  }

  Widget _textSmall(String text, Color color) {
    return Text(
      '$text',
      style: CustomFontStyle.small_bold_gothic(size.width * 1.2, color),
    );
  }
}

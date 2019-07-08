import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/viewmodel/settings_model.dart';
import 'package:flutter_musically_app/resources/constant.dart';
import 'package:flutter_musically_app/ui/app.dart';
import 'package:flutter_musically_app/ui/routes.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/viewmodel/music_provider.dart';
import 'locator.dart';

void main() {
  setLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlareController _flareController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var pref = SharedPreferences.getInstance();
    pref.then((val) {
      if (val.get('theme') == null) {
        val.setString('theme', '0');
        locator<SettingsModel>().primary =
        Data.primary[0];
        locator<SettingsModel>().secondry =
        Data.secondry[0];
      } else {
        locator<SettingsModel>().primary =
            Data.primary[int.parse(val.get('theme'))];
        locator<SettingsModel>().secondry =
            Data.secondry[int.parse(val.get('theme'))];
      }
      if (val.get('colorMode') != null)
        locator<SettingsModel>().darkMode = int.parse(val.get('colorMode'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MusicModel>(
      builder: (_) => MusicModel(),
      child: MaterialApp(
          title: 'Musically',
          debugShowCheckedModeBanner: false,
//        initialRoute: '/',
          onGenerateRoute: Router.generateRoute,
          home: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                width: 300.0,
                child: SplashScreen.navigate(
                  name: 'assets/aeologo.flr',
                  next: App(),
                  until: () => Future.delayed(Duration(seconds: 3)),
                  startAnimation: 'Untitled',
                ),
              ),
            ),
          )),
    );
  }
}

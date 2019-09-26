import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musically_app/ui/app.dart';
import 'package:flutter_musically_app/ui/routes.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';
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
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MusicModel>(
      builder: (_) => MusicModel(),
      child: MaterialApp(
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          title: 'Musically',
          debugShowCheckedModeBanner: false,
//        initialRoute: '/',
          onGenerateRoute: Router.generateRoute,
          home: Scaffold(backgroundColor: Colors.white,
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

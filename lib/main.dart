import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_musically_app/ui/routes.dart';
import 'package:provider/provider.dart';

import 'core/viewmodel/music_provider.dart';
import 'locator.dart';

void main() {
  Admob.initialize(getAppId());
  setLocator();
  runApp(MyApp());
}

String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-4562399661893712~4350420420';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-4562399661893712~4350420420';
  }
  return null;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MusicModel>(
      builder: (_) => MusicModel(),
      child: MaterialApp(
        title: 'Musically',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

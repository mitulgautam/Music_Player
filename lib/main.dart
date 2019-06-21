import 'package:flutter/material.dart';
import 'package:flutter_musically_app/ui/routes.dart';
import 'package:provider/provider.dart';

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

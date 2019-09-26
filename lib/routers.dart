import 'package:flutter/material.dart';
import 'package:musically/ui/app.dart';
import 'package:musically/ui/views/Music.dart';
import 'package:musically/ui/views/Search.dart';
import 'package:musically/ui/views/Settings.dart';
import 'package:musically/ui/views/Home.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/setting':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
      case '/music':
        return MaterialPageRoute(builder: (_) => Music());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text(' No routes defined for ${setting.name}'),
                  ),
                ));
    }
  }
}

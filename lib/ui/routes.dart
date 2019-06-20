import 'package:flutter/material.dart';
import 'package:flutter_musically_app/ui/view/home.dart';
import 'package:flutter_musically_app/ui/view/music.dart';
import 'package:flutter_musically_app/ui/view/search.dart';
import 'package:flutter_musically_app/ui/view/setting.dart';

import 'app.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => App());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/music':
        return MaterialPageRoute(builder: (_) => Music());
      case '/setting':
        return MaterialPageRoute(builder: (_) => Settings());
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
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

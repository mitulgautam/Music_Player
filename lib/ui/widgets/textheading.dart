import 'package:flutter/material.dart';
import 'package:musically/ui/shared/styles.dart';

class HeadingOne extends StatelessWidget {
  String title;

  HeadingOne({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Text(
        '$title',
//        style: Style.heading,
      ),
    );
  }
}

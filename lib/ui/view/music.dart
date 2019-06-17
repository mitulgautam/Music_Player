import 'package:flutter/material.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';

class Music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Music",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Coming soon',
          style: CustomFontStyle.medium_bold_gothic(
              MediaQuery.of(context).size.width),
        ),
      ),
    );
  }
}

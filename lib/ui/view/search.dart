import 'package:flutter/material.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Search",
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

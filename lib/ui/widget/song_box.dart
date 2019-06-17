import 'package:flutter/material.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';

class MusicBox extends StatelessWidget {
  final Size size;
  final String text;
  final String image;

  MusicBox({@required this.size, @required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: size.width / 2.8,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: size.width / 2.9,
              height: size.width / 2.9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              text,
             // style: TextStyle(fontSize: 12.0),
              style: CustomFontStyle.small_bold_gothic(size.width),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      elevation: 0.0,
    );
  }
}

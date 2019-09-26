import 'package:flutter/material.dart';
import 'package:musically/ui/shared/styles.dart';

import '../../SampleData.dart';
import 'SongBox.dart';

class MusicList extends StatelessWidget {
  final List<String> list;
  final String heading;
  final Size size;
  final List<String> image;

  MusicList(
      {@required this.list,
      @required this.heading,
      @required this.size,
      this.image});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              heading,
              style: Style.medium_bold_gothic(size.width),
            ),
          ),
          Container(
            height: size.width/2,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return MusicBox(
                    text: list[index],
                    size: size,
                    image: image[index],
                  );
                }),
          ),
          SizedBox(
            height: 8.0,
          )
        ],
      ),
    );
  }
}

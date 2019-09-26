import 'package:flutter/material.dart';
import 'package:musically/ui/shared/styles.dart';
import 'package:musically/ui/widgets/SongBox.dart';
import 'package:musically/ui/widgets/music_list.dart';
import 'package:fluttery_seekbar/fluttery_seekbar.dart';
import '../../SampleData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: SizedBox(
            height: size.width / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Musically',
                  style: Style.medium_bold_gothic(width),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/setting');
                  },
                  child: ClipOval(
                      child: CircleAvatar(
                    maxRadius: width / 18,
                    minRadius: width / 18,
                    child: Image.network(
                      Data.profileImage,
                      fit: BoxFit.cover,
                    ),
                  )),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Card(
                elevation: 16.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    'assets/top_banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: Data.heading_music.length,
                itemBuilder: (context, index) {
                  return MusicList(
                    heading: Data.heading_music[index],
                    size: size,
                    list: Data.bollywood,
                    image: Data.image[index],
                  );
                }),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_musically_app/core/model/song.dart';
import 'package:flutter_musically_app/core/services/repository.dart';
import 'package:flutter_musically_app/resources/constant.dart';
import 'package:flutter_musically_app/resources/fontstyle.dart';
import 'package:flutter_musically_app/ui/widget/music_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository repository = Repository();

  @override
  Widget build(BuildContext context) {
    List<Song> song = repository.getData().song;
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
                  'Musically',style: CustomFontStyle.medium_bold_gothic(size.width),
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
                itemCount: song.length,
                itemBuilder: (context, index) {
                  return MusicList(
                    heading: Data.heading[index],
                    list: song[index].music,
                    image: song[index].images,
                    size: size,
                  );
                }),
          ],
        ));
  }
}

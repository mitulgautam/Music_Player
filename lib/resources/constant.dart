import 'package:flutter/material.dart';
import 'package:flutter_musically_app/resources/theme.dart';

class Data {
  static final List<String> bollywood = [
    'Trending - Bollywood Remix',
    'Most Played - Bollywood Romantic',
    'Personalised - Playlist'
  ];
  static final List<String> punjabi = [
    'Trending - Punjabi Pop',
    'Most Played - Punjabi Pop',
    'Personalised - Playlist'
  ];
  static final String profileImage =
      "https://short-biography.com/wp-content/uploads/hrithik-roshan/Hrithik-Roshan.jpg";
  static final List<List<String>> heading_music = [bollywood, punjabi];
  static final List<String> heading = ["Bollywood", "Punjabi"];

  static final List<String> bollywoodImages = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png'
  ];
  static final List<String> punjabiImages = [
    'assets/image4.png',
    'assets/image6.jpg',
    'assets/image7.jpg',
  ];
  static final List<List<String>> image = [bollywoodImages, punjabiImages];
  static final List<String> imageplayer = [
    'assets/art1.jpg',
    'assets/art2.jpg',
    'assets/art3.jpg',
    'assets/art4.jpg'
  ];
  static List<Color> primary = [
    Colors.purple,
    Colors.amber,
    Colors.green,
    Colors.lightBlue,
    CustomTheme.red
  ];
  static List<Color> secondry = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  List<List<Color>> appTheme = [primary, secondry];
}

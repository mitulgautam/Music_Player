import 'package:flutter/material.dart';

class Style {
  //define font style here
  static medium_bold_gothic(var size) => TextStyle(
      fontSize: size / 24.0, fontFamily: 'Gothic', color: Colors.black);

  static small_bold_gothic(var size) =>
      TextStyle(fontSize: size / 44, fontFamily: 'Gothic', color: Colors.black);

  static very_small_bold_gothic(var size) =>
      TextStyle(fontSize: size / 48, fontFamily: 'Gothic', color: Colors.black);

  static medium_open_sans(var size) =>
      TextStyle(fontSize: size, fontFamily: 'Gothic', color: Colors.black);

  static small_open_sans(var size) =>
      TextStyle(fontSize: size/36, fontFamily: 'Gothic', color: Colors.black54);

  //define fonts color here
  static final red = Color(0xfffc0506);
  static final dark = Color(0xff2a2a2a);
  static final gray = Color(0xffEBECED);
  static final yellow = Color(0xfff49818);
}

import 'package:flutter/material.dart';

class CustomFontStyle {
  //define font style here

  static medium_bold_gothic(var size, Color color) =>
      TextStyle(fontSize: size / 24.0, fontFamily: 'Gothic', color: color);

  static small_bold_gothic(var size, Color color) =>
      TextStyle(fontSize: size / 44, fontFamily: 'Gothic', color: color);

  static very_small_bold_gothic(var size, Color color) =>
      TextStyle(fontSize: size / 48, fontFamily: 'Gothic', color: color);

  static medium_open_sans(var size, Color color) =>
      TextStyle(fontSize: size, fontFamily: 'Gothic', color: color);

  static small_open_sans(var size, Color color) =>
      TextStyle(fontSize: size / 36, fontFamily: 'Gothic', color: color);

  static very_small_bold_gothic_no_color(var size) =>
      TextStyle(fontSize: size / 48, fontFamily: 'Gothic');
}

import 'package:flutter/material.dart';
const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    backgroundColor:primaryClr,
    brightness: Brightness.light,

  );
  static final Dark = ThemeData(
    primaryColor: darkGreyClr,
    backgroundColor:darkGreyClr,
    brightness: Brightness.dark
  );
  TextStyle get headingStyle {
    return TextStyle(
      color:Colors.white ,
      fontSize: 20);
  }
}
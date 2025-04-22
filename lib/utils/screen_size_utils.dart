import 'package:flutter/material.dart';

class ScreenSize {
  static double screenW(BuildContext context) => MediaQuery.of(context).size.width;
  static double screenH(BuildContext context) => MediaQuery.of(context).size.height;

  static double widthFactor(BuildContext context) => screenW(context) / 360;
  static double heightFactor(BuildContext context) => screenH(context) / 800;
}
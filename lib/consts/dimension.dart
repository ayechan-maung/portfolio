import 'package:flutter/material.dart';

class Dimension {
  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Widget spaceWidth(double width) {
    return SizedBox(width: width);
  }

  static Widget spaceHeight(double width) {
    return SizedBox(width: width);
  }
}

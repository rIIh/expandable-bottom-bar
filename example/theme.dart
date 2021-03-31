import 'package:flutter/material.dart';

class FlutterDark {
  static ThemeData dark(ThemeData template) {
    var themeData = template;
    var newThemeData = themeData.copyWith(
      canvasColor: Color.fromRGBO(25, 39, 62, 1),
      backgroundColor: Color.fromRGBO(31, 50, 69, 1),
      bottomAppBarColor: Color.fromRGBO(39, 59, 89, 1),
      buttonColor: Colors.deepOrange,
      indicatorColor: Colors.deepOrange,
      textTheme: template.textTheme.apply(
        fontFamily: 'Poppins',
      ),
    );

    return newThemeData;
  }
}

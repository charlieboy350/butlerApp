import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  //light
  static TextStyle fontLight({
    @required Color color,
    double letterSpacing = 0.0,
    double fontSize = 12.0,
  }) =>
      GoogleFonts.heebo(
          color: color,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: fontSize);
  //regular
  static TextStyle fontRegular(
          {@required Color color,
          double letterSpacing = 0.0,
          double fontSize = 12.0,
          bool bold = false,
          bool underLine = false}) =>
      GoogleFonts.heebo(
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.w400,
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          decoration:
              underLine ? TextDecoration.underline : TextDecoration.none,
          fontSize: fontSize);
  //medium
  static TextStyle fontMedium(
          {@required Color color,
          double letterSpacing = 0.0,
          double fontSize = 12.0,
          bool bold = false,
          FontWeight fontWeight = FontWeight.w500}) =>
      GoogleFonts.heebo(
          color: color,
          fontWeight: bold ? FontWeight.bold :fontWeight,
          fontSize: fontSize);
  static TextStyle kateNormalF60WithW400(
          {@required Color color,
          double letterSpacing = 0.0,
          double fontSize = 60.0}) =>
      TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontFamily: "Kate",
          fontStyle: FontStyle.normal,
          letterSpacing: letterSpacing,
          fontSize: fontSize);

  static TextStyle kateMediumF25WithW400(
          {@required Color color, double letterSpacing = 0.0}) =>
      TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontFamily: "Kate",
        fontStyle: FontStyle.normal,
        letterSpacing: letterSpacing,
        fontSize: 25.0,
      );
}

import 'package:babychart/theme/theme_helper.dart';
import 'package:flutter/material.dart';

class CustomButtonStyles {
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
    backgroundColor: appTheme.gray100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Removed .h, assuming you mean fixed value
    ),
  );

  static ButtonStyle get fillWhiteA => ElevatedButton.styleFrom(
    backgroundColor: appTheme.whiteA70001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7), // Removed .h, assuming you mean fixed value
    ),
  );

  static ButtonStyle get fillWhiteATL11 => ElevatedButton.styleFrom(
    backgroundColor: appTheme.whiteA70001,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(11), // Removed .h, assuming you mean fixed value
    ),
  );

  // Text button style
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
}

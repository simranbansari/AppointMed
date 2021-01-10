import 'package:flutter/material.dart';

const Color appThemeColor = Color(0xff0DAC99);
Color lightAppThemeColor = Color(0xff0DAC99).withOpacity(0.5);
const Color unselectedButtonColor = Color(0xff555555);
const Color appTextColor = Color(0xff555555);

const String appFont = 'Quicksand';

final TextStyle headingText1 = TextStyle(
  color: appThemeColor,
  fontSize: 36,
  fontFamily: appFont,
);

final TextStyle headingText2 = TextStyle(
  color: appThemeColor,
  fontSize: 24.0,
  fontFamily: appFont,
);

final TextStyle headingText3 = TextStyle(
  color: appTextColor,
  fontSize: 24.0,
  fontFamily: appFont,
  fontWeight: FontWeight.bold,
);

final TextStyle bodyText = TextStyle(
  color: appTextColor,
  fontSize: 18.0,
  fontFamily: appFont,
);

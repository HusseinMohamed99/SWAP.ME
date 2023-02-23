import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  static const primaryColor = Color.fromARGB(255, 0, 74, 134);
  static const secondaryColor = Color.fromARGB(255, 255, 255, 255);
  static const backgroundColor = Color.fromARGB(255, 245, 245, 245);
  static const blackPrimary = Color.fromARGB(255, 0, 0, 0);
  static const yellowColor = Color.fromARGB(255, 255, 255, 0);
  static const blueColor = Color.fromARGB(255, 68, 138, 255);
  static const greyColor = Color.fromARGB(255, 152, 150, 150);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: backgroundColor,
          systemNavigationBarColor: backgroundColor,
          systemNavigationBarDividerColor: backgroundColor),
    ),
    scaffoldBackgroundColor: backgroundColor,
    cardColor: secondaryColor,
    textTheme: TextTheme(
      headline1: GoogleFonts.cairo(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: blackPrimary,
      ),
      headline2: GoogleFonts.cairo(
        fontSize: 25,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.cairo(
        fontSize: 21,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.cairo(
        fontSize: 22,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      headline5: GoogleFonts.cairo(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline6: GoogleFonts.cairo(
        fontSize: 17,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
      subtitle1: GoogleFonts.cairo(
        fontSize: 15,
        color: greyColor,
        fontWeight: FontWeight.w400,
      ),
      subtitle2: GoogleFonts.cairo(
        fontSize: 12,
        color: blackPrimary,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

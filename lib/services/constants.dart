//Border Radius
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const BorderRadius radius = BorderRadius.all(
  Radius.circular(10),
);

//Shadow
const List<BoxShadow> shadow = [
  BoxShadow(
    blurRadius: 10,
    color: Colors.black12,
    offset: Offset(1, 3),
  )
];

//Light Theme
final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color.fromRGBO(64, 158, 255, 1),
  backgroundColor: Color.fromRGBO(242, 242, 247, 1),
  scaffoldBackgroundColor: Colors.white,
  cardColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    shadowColor: Colors.black.withOpacity(0.2),
    titleTextStyle: GoogleFonts.comfortaa(
      color: Colors.black,
      fontSize: 18,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: GoogleFonts.comfortaa(),
    bodyText2: GoogleFonts.comfortaa(),
  ).apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
);

//Dark Theme
final darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color.fromRGBO(64, 158, 255, 1),
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Colors.black,
  cardColor: Colors.grey[900],
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    shadowColor: Colors.black.withOpacity(0.2),
    titleTextStyle: GoogleFonts.comfortaa(
      color: const Color.fromRGBO(64, 158, 255, 1),
      fontSize: 18,
    ),
  ),
  textTheme: TextTheme(
    bodyText1: GoogleFonts.comfortaa(),
    bodyText2: GoogleFonts.comfortaa(),
  ).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);

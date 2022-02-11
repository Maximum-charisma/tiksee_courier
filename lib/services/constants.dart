//Border Radius
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String apiUrl = "https://test-tiksee.ru/api/";

const String authToken =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTMsImVtYWlsIjoidGVzdEB0ZXN0LnJ1Iiwicm9sZSI6ImNvdXJpZXIiLCJpYXQiOjE2NDM4NzQ5NDZ9.UF8eBYsl8tCzoK3mS4MNYxhOZuZUQE6MBcKubylgvcw';

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
  cardColor: Color.fromRGBO(242, 242, 247, 1),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    shadowColor: Colors.black.withOpacity(0.2),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
  ),
  textTheme: TextTheme(bodyText1: TextStyle(height: 17)).apply(
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
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
  ),
  textTheme: TextTheme(bodyText1: TextStyle(height: 17)).apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
);

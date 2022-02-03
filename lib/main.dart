import 'package:flutter/material.dart';
import 'package:tiksee_courier/screens/auth/auth_screen.dart';
import 'package:tiksee_courier/screens/main_screen.dart';
import 'package:tiksee_courier/services/constants.dart';

void main() {
  runApp(
    MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    ),
  );
}

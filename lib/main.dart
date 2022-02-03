import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:tiksee_courier/screens/auth/auth_screen.dart';
import 'package:tiksee_courier/screens/check_screen.dart';
import 'package:tiksee_courier/services/constants.dart';
import 'package:tiksee_courier/services/prefs_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var provider = await DataProvider.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => provider,
        ),
      ],
      child: OverlaySupport.global(
        child: MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          home: const CheckData(),
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiksee_courier/screens/auth/auth_screen.dart';
import 'package:tiksee_courier/screens/main_screen.dart';
import 'package:tiksee_courier/services/prefs_handler.dart';

class CheckData extends StatelessWidget {
  const CheckData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    return Scaffold(
      body: futureBuilder(provider, context),
    );
  }

  Widget futureBuilder(
    DataProvider provider,
    BuildContext context,
  ) {
    if (provider.hasCourier) {
      return const MainScreen();
    } else {
      return const AuthScreen();
    }
  }
}

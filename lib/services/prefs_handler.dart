import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiksee_courier/services/models/auth.dart';
import 'package:tiksee_courier/services/models/user.dart';

class CourierPrefsHandler {
  CourierPrefsHandler(this._preferences);

  final SharedPreferences _preferences;

  final String _courierToken = 'courierToken';
  final String _courierSecretRoute = 'courierSecreteRoute';
  final String _courierEmail = 'courierEmail';
  final String _courierPhone = 'courierPhone';

  static Future<CourierPrefsHandler> getInstance() async {
    var shared = await SharedPreferences.getInstance();
    return CourierPrefsHandler(shared);
  }

  String getCourierToken() {
    return _preferences.getString(_courierToken) ?? '';
  }

  String getCourierSecreteRoute() {
    return _preferences.getString(_courierSecretRoute) ?? '';
  }

  String getCourierEmail() {
    return _preferences.getString(_courierEmail) ?? '';
  }

  String getPhone() {
    return _preferences.getString(_courierPhone) ?? '';
  }

  void setCourierToken(String token) {
    _preferences.setString(_courierToken, token);
  }

  void setCourierSecreteRoute(String secreteRoute) {
    _preferences.setString(_courierSecretRoute, secreteRoute);
  }

  void setCourierEmail(String email) {
    _preferences.setString(_courierEmail, email);
  }

  void setCourierPhone(String phone) {
    _preferences.setString(_courierPhone, phone);
  }

  void setEmptyCourier() {
    _preferences.setString(_courierToken, '');
    _preferences.setString(_courierSecretRoute, '');
    _preferences.setString(_courierEmail, '');
    _preferences.setString(_courierPhone, '');
  }
}

class DataProvider extends ChangeNotifier {
  DataProvider(this._auth);

  Auth _auth;

  Auth get auth => _auth;

  bool get hasCourier => auth.token != '';

  static Future<DataProvider> getInstance() async {
    var courierPrefs = await CourierPrefsHandler.getInstance();

    return DataProvider(
      Auth(
        token: courierPrefs.getCourierToken(),
        secretRoute: courierPrefs.getCourierSecreteRoute(),
      ),
    );
  }

  void setCourier(Auth auth) {
    _auth = auth;
    notifyListeners();
    CourierPrefsHandler.getInstance().then(
      (value) {
        value.setCourierToken(auth.token);
        value.setCourierSecreteRoute(auth.secretRoute);
      },
    );
  }

  void setCourierToken(String newToken) {
    auth.token = newToken;
    notifyListeners();
    CourierPrefsHandler.getInstance().then(
      (value) => value.setCourierToken(newToken),
    );
  }

  void setCourierName(String newSecretRoute) {
    _auth.secretRoute = newSecretRoute;
    notifyListeners();
    CourierPrefsHandler.getInstance().then(
      (value) => value.setCourierSecreteRoute(newSecretRoute),
    );
  }

  void signOutCourier() {
    _auth = Auth(token: '', secretRoute: '');
    notifyListeners();

    CourierPrefsHandler.getInstance().then((value) => value.setEmptyCourier());
  }
}

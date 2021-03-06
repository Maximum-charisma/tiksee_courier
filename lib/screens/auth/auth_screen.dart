import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiksee_courier/screens/main_screen.dart';
import 'package:tiksee_courier/services/app_bar.dart';
import 'package:tiksee_courier/services/models/auth.dart';
import 'package:tiksee_courier/services/navigator.dart';
import 'package:tiksee_courier/services/network.dart';
import 'package:tiksee_courier/services/prefs_handler.dart';
import 'package:tiksee_courier/services/settings_card.dart';
import 'package:tiksee_courier/services/text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailTextField = TextEditingController();
  final _passwordTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          StandartAppBar(
            title: const Text('Авторизация'),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                width: 100,
                margin: const EdgeInsets.fromLTRB(0, 60, 0, 50),
                child: Theme.of(context).brightness == Brightness.light
                    ? Image.asset('lib/images/logo.png')
                    : Image.asset('lib/images/logo_white.png'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TextFieldWidget(
              hint: 'E-Mail',
              controller: _emailTextField,
            ),
          ),
          SliverToBoxAdapter(
            child: TextFieldWidget(
              hint: 'Пароль',
              password: true,
              controller: _passwordTextField,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsCard(
              icon: null,
              text: 'Войти',
              color: null,
              onTap: () => auth(provider),
            ),
          ),
        ],
      ),
    );
  }

  void auth(DataProvider provider) async {
    if (_emailTextField.text.isNotEmpty && _passwordTextField.text.isNotEmpty) {
      var result = await NetHandler.authCourier(
          context, _emailTextField.text, _passwordTextField.text);
      print(result);

      if (result != null) {
        provider.setCourier(
            Auth(token: result.token, secretRoute: result.secretRoute));
      }
    }
  }
}

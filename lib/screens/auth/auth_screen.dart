import 'package:flutter/material.dart';
import 'package:tiksee_courier/services/app_bar.dart';
import 'package:tiksee_courier/services/settings_card.dart';
import 'package:tiksee_courier/services/text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                child: Image.asset('lib/images/logo.png'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TextFieldWidget(
              hint: 'E-Mail',
            ),
          ),
          SliverToBoxAdapter(
            child: TextFieldWidget(
              hint: 'Пароль',
              password: true,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsCard(
              icon: null,
              text: 'Войти',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

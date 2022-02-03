import 'package:flutter/material.dart';
import 'package:tiksee_courier/services/account_card.dart';
import 'package:tiksee_courier/services/app_bar.dart';
import 'package:tiksee_courier/services/settings_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StandartAppBar(
            title: const Text('Аккаунт'),
          ),
          const SliverToBoxAdapter(
            child: AccountCard(),
          ),
          SliverToBoxAdapter(
            child: SettingsCard(
              icon: Icons.logout,
              text: 'Выйти',
              onTap: () {
                // provider.signOutCourier();
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiksee_courier/services/account_card.dart';
import 'package:tiksee_courier/services/app_bar.dart';
import 'package:tiksee_courier/services/models/user.dart';
import 'package:tiksee_courier/services/network.dart';
import 'package:tiksee_courier/services/prefs_handler.dart';
import 'package:tiksee_courier/services/settings_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  User? _user;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getCourier();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<DataProvider>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          StandartAppBar(
            title: const Text('Аккаунт'),
          ),
          SliverToBoxAdapter(
            child: AccountCard(
              phone: _user?.phone,
              email: _user?.email,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsCard(
              icon: Icons.logout,
              text: 'Выйти',
              onTap: () {
                provider.signOutCourier();
              },
            ),
          ),
        ],
      ),
    );
  }

  void getCourier() async {
    var result = await NetHandler.getCourier(context);
    if (result != null) {
      setState(() {
        _user = result;
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:tiksee_courier/services/account_card.dart';
import 'package:tiksee_courier/services/app_bar.dart';
import 'package:tiksee_courier/services/constants.dart';
import 'package:tiksee_courier/services/models/user.dart';
import 'package:tiksee_courier/services/network.dart';
import 'package:tiksee_courier/services/prefs_handler.dart';
import 'package:tiksee_courier/services/settings_card.dart';
import 'package:tiksee_courier/services/settings_switch.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Courier? _user;
  bool switchValue = false;
  bool _loading = true;

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
        physics: const BouncingScrollPhysics(),
        slivers: [
          StandartAppBar(
            title: const Text('Аккаунт'),
          ),
          if (!_loading)
            SliverToBoxAdapter(
              child: AccountCard(
                phone: _user?.phone,
                email: _user?.email,
                name: _user?.name,
              ),
            )
          else
            SliverToBoxAdapter(
              child: SkeletonAnimation(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  padding: const EdgeInsets.only(left: 15),
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: radius,
                  ),
                ),
              ),
            ),
          const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Настройки:',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsSwitch(
              icon: null,
              text: 'Активная смена',
              switchValue: switchValue,
              onChanged: (value) {
                setState(() {
                  switchValue = value;
                });
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: SettingsCard(
                icon: Icons.logout,
                color: null,
                text: 'Выйти',
                onTap: () {
                  provider.signOutCourier();
                },
              ),
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
        _loading = false;
      });
    }
  }
}

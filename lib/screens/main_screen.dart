import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:tiksee_courier/screens/bottom_nav/account_screen.dart';
import 'package:tiksee_courier/screens/bottom_nav/finance_screen.dart';
import 'package:tiksee_courier/screens/bottom_nav/orders_screen.dart';
import 'package:tiksee_courier/services/prefs_handler.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final List<BottomNavigationBarItem> _tabBar = [
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.checkCircle),
    label: "Заказы",
  ),
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.coins),
    label: "Финансы",
  ),
  const BottomNavigationBarItem(
    icon: Icon(LineIcons.userCircle),
    label: "Аккаунт",
  ),
];

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabBar.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) {
          setState(() {
            _tabController.index = index;
            _currentTabIndex = index;
          });
        },
        currentIndex: _currentTabIndex,
        items: _tabBar,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [OrdersScreen(), FinanceScreen(), AccountScreen()],
      ),
    );
  }
}

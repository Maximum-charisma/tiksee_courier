import 'package:flutter/material.dart';
import 'package:tiksee_courier/screens/bottom_nav/account_screen.dart';
import 'package:tiksee_courier/screens/bottom_nav/finance_screen.dart';
import 'package:tiksee_courier/screens/bottom_nav/orders_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

final List<BottomNavigationBarItem> _tabBar = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.list_alt_outlined),
    label: "Заказы",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.money_rounded),
    label: "Финансы",
  ),
  const BottomNavigationBarItem(
    icon: Icon(Icons.man_outlined),
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
        backgroundColor: Theme.of(context).backgroundColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color.fromRGBO(255, 87, 87, 1),
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
